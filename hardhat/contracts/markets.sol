// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./vaults.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol";

contract Market is ERC4626Upgradeable {

    uint64 version;

    string title; 

    uint256 LLTV; 
    uint256 blocksPerYear; 
    uint256 lastAccureBlock; 
    uint256 currentBorrowIndex;
    uint256 InterestRate; 

    address vault; // address which will receive (100 - adminFee)% from fee  

    uint256 adminFee; 

    uint256 liquidationCoefficient;

    uint256 borrowPrice; 
    uint256 collateralPrice; 

    Token collateralToken; 
    Token borrowToken; 
    Share collateralShare; 
    Share borrowShare; 

    mapping (address => uint256) userBorrowIndexAtEntry;

    // constructor()
    function init(
        string memory title_, uint256 LLTV_, address vault_, uint256 liquidationCoefficient_, uint256 borrowPrice_, 
        uint256 collateralPrice_, uint256 adminFee_, uint256 InterestRate_, Share colShare, Share borShare
    ) public reinitializer(++version) {

        collateralShare = colShare;
        borrowShare     = borShare;

        collateralToken = Token(collateralShare.asset());
        borrowToken     = Token(borrowShare.asset());

        __ERC4626_init(IERC20(collateralToken));
        __ERC20_init(collateralToken.name(), collateralToken.symbol());

        title = title_;

        LLTV = LLTV_;
        blocksPerYear = 2102400;
        lastAccureBlock = block.number;
        currentBorrowIndex = currentBorrowIndex == 0 ? 1e18 : currentBorrowIndex;
        InterestRate = InterestRate_ * 1e8;

        vault = vault_;

        adminFee = adminFee_;

        liquidationCoefficient = liquidationCoefficient_;

        borrowPrice = borrowPrice_;
        collateralPrice = collateralPrice_;
    }

    modifier updateIndexAndLTV(address user) {
        currentBorrowIndex += currentBorrowIndex * InterestRate * (block.number - lastAccureBlock) / (blocksPerYear * 1e12); //1e12 is precision
        lastAccureBlock = block.number;
        _;
        if(LTV(user) > LLTV) liquidate(user);
    }

    function liquidate(address user) public {
        uint256 collateralBalance = collateralShare.balanceOf(user);
        collateralToken.transfer(address(this), user, collateralBalance * liquidationCoefficient / 100);
        collateralShare.burn(user, collateralBalance);
        borrowShare.burn(user, borrowShare.balanceOf(user));
    }

    function accruedInterest(address user) public view returns(uint256){
        return borrowShare.balanceOf(user) * (currentBorrowIndex - userBorrowIndexAtEntry[user]) / 1e18;  // 1e18 is WAD
    }

    function totalDept(address user) public view returns(uint256){
        return borrowShare.balanceOf(user) * currentBorrowIndex / 1e18; // 1e18 is WAD
    }

    function LTV(address user) public view returns(uint256){
        if(borrowShare.balanceOf(user) == 0) return 0;
        if(collateralShare.balanceOf(user) == 0) return LLTV + 1;
    // formula : 100% * (borrowAmount  * borrowPrice)  / (       collateralAmount          * collateralPrice)
        return ( 100 * totalDept(user) * borrowPrice ) / ( collateralShare.balanceOf(user) * collateralPrice ); 
    }
    
    function supply(uint256 amount) public updateIndexAndLTV(msg.sender) {
        collateralToken.transfer(msg.sender, address(this), amount);
        collateralShare.mint(msg.sender, amount);
    }

    function borrow(uint256 amount) public updateIndexAndLTV(msg.sender) {
        if(borrowShare.balanceOf(msg.sender) == 0) userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex;
        borrowToken.transfer(address(this), msg.sender, amount);
        borrowShare.mint(msg.sender, amount * 1e18 / currentBorrowIndex);  // 1e18 is WAD
    }

    function repayPart(uint256 amount) public updateIndexAndLTV(msg.sender) {
        require(amount > 0, "amount must be > 0");
        uint256 startInterest = accruedInterest(msg.sender);
        uint256 amountToAdmin;
        uint256 amountToVault;
        // paying only %, doesnt burn any shares (payment will be after if-else)
        if(amount < startInterest){
            amountToAdmin = amount * adminFee / 100;
            amountToVault = amount - amountToAdmin;
            // increasing entry borrow index to reduce user dept percentage, other params used in % formula shouldn't be changed
            // formula : currentInterest = borrowShares * (currentIndex - startIndex)
            // -> (currentInterest / borrowShares) = currentIndex - startIndex
            // -> startIndex + (currentInterest / borrowShares) = currentIndex
            // -> startIndex = currentIndex - (currentInterest / borrowShares)
            // since we decreased interest, currentInterest is startInterest minus amount we payed
            // so if we payed same amount as %, formula for % will give 0
            userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex - ( (startInterest - amount) / borrowShare.balanceOf(msg.sender) );
        } 
        // paying all % + some amount of dept (first we pay dept body then % themself)
        else {
            amountToAdmin = startInterest * adminFee / 100;
            amountToVault = startInterest - amountToAdmin;
            // clearing dept percentage
            userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex;
            // calculating amount of tokens which will reduce dept body
            uint256 payment = amount - startInterest;
            // transfering tokens to market and burning shares to reduce dept
            borrowToken.transfer(msg.sender, address(this), payment);
            borrowShare.burn(msg.sender, payment * 1e18 / currentBorrowIndex); // 1e18 is WAD
        }
        // transfering fee to vault and market in 70:30 ratio
        borrowToken.transfer(msg.sender, vault, amountToVault);
        borrowToken.transfer(msg.sender, address(this), amountToAdmin);
        // telling vault that we sended him tokens
        Vault(vault).increaseAssets(amountToVault);
    }

    function repayFull() public updateIndexAndLTV(msg.sender) {
        // dept percentage
        uint256 interest = accruedInterest(msg.sender);
        uint256 vaultAmount = interest * (100 - adminFee) / 100;
        // clearing dept percentage
        userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex;
        // transfering fee to vault and market in 70:30 ratio
        borrowToken.transfer(msg.sender, vault, vaultAmount);
        borrowToken.transfer(msg.sender, address(this), interest * adminFee / 100);
        // telling vault that we sended him tokens
        Vault(vault).increaseAssets(vaultAmount);
        // transfering dept body to market and burning all shares
        borrowToken.transfer(msg.sender, address(this), totalDept(msg.sender) - interest);
        borrowShare.burn(msg.sender, borrowShare.balanceOf(msg.sender));
    }

    function withdrawPart(uint256 amount) public updateIndexAndLTV(msg.sender) {
        collateralToken.transfer(address(this), msg.sender, amount);
        collateralShare.burn(msg.sender, amount);
    }

    function withdrawFull() public updateIndexAndLTV(msg.sender) {
        uint256 amount = collateralShare.balanceOf(msg.sender);
        collateralToken.transfer(address(this), msg.sender, amount);
        collateralShare.burn(msg.sender, amount);
    }

    function getMarket() public view returns(
        string memory,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256,
        address,
        address,
        address,
        address,
        address,
        uint256,
        uint256
    ){
        return(
            title,
            borrowPrice,
            collateralPrice,
            LLTV,
            adminFee,
            lastAccureBlock,
            currentBorrowIndex,
            InterestRate * 100 / 1e12, //1e12 is precision
            vault,
            address(collateralToken),
            address(borrowToken),
            address(collateralShare),
            address(borrowShare),
            borrowToken.balanceOf(address(this)),
            collateralToken.balanceOf(address(this))
        );
    }

    function getUserMarket() public view returns(
        uint256,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256
    ){
        return(
            userBorrowIndexAtEntry[msg.sender],
            collateralShare.balanceOf(msg.sender),
            borrowShare.balanceOf(msg.sender),
            LTV(msg.sender),
            borrowToken.balanceOf(msg.sender),
            collateralToken.balanceOf(msg.sender)
        );
    }
}