// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./vault.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol";

contract Market is ERC4626Upgradeable {

    string title;
    // calculating in %, e.g. 1 token1 = 1 token2 => cost = 100 (%)
    uint USDT_UCDC_cost;
    uint USD1_USDC_cost;
    uint USDC_USD_cost;
    uint DAI_USDC_cost; 
    // calculating in % (e.g. 70% LLTV = 70)
    uint LLTV;
    uint blocksPerYear;
    uint lastAccureBlock;
    uint currentBorrowIndex;
    uint InterestRate;
    address vault; // address which will receive 70% from fee 
    address admin; // address which will receive 30% from fee

    Token collateralToken;
    Token borrowToken;
    Share collateralShare;
    Share borrowShare;

    mapping (address => uint) userBorrowIndexAtEntry;

    // constructor()
    function init(
        uint USDT_cost, uint USD1_cost, uint USDC_cost, uint DAI_cost, uint borrowIndex,
        string memory title_, uint LLTV_, address vault_, address admin_, uint InterestRate_, 
        Token collateralToken_, Token borrowToken_, uint64 version
    ) public reinitializer(version) {
        __ERC4626_init(IERC20(collateralToken_));
        __ERC20_init(collateralToken_.name(), collateralToken_.symbol());
        title = title_;
        USDT_UCDC_cost = USDT_cost;
        USD1_USDC_cost = USD1_cost;
        USDC_USD_cost  = USDC_cost;
        DAI_USDC_cost  = DAI_cost;
        LLTV = LLTV_;
        blocksPerYear = 2102400;
        lastAccureBlock = block.number;
        currentBorrowIndex = borrowIndex;
        InterestRate = InterestRate_;
        vault = vault_;
        admin = admin_;
        collateralToken = collateralToken_;
        borrowToken     = borrowToken_;
        collateralShare = new Share(address(collateralToken_), collateralToken_.name(), collateralToken_.symbol(), collateralToken_.decimals());
        borrowShare     = new Share(address(borrowToken_),     borrowToken_.name(),     borrowToken_.symbol(),     borrowToken_.decimals()    );
    }

    modifier updateIndexAndLTV() {
        currentBorrowIndex += currentBorrowIndex * InterestRate * (block.number - lastAccureBlock) / blocksPerYear;
        _;
        require(LTV(msg.sender) <= LLTV, "LTV is larger than LLTV");
    }

    function accruedInterest(address user) public view returns(uint){
        return borrowShare.balanceOf(user) * ( currentBorrowIndex - userBorrowIndexAtEntry[user] );
    }

    function LTV(address user) public view returns(uint){
        // formula : (borrowAmount * borrowPrice) / (collateralAmount * collateralPrice) * 100(%)
        // "price" is how many assets you will receive for 1 share token, e.g. if 2 shares will give 1 asset
        // price will be described as 0.5 OR (1 / 2) where "2" can be moved to denominator.
        // same way we calculate collateralPrice, but we move "2" to numenator since price param is in denominator
        // instead of numerator as borrowPrice, both "2" in numerator and demonimator is canceled out 
        // due to inverse fractions and we have only "convertToAssets" calls. 
        // and if we use same number of shares to calculate prices, we will receive correct result  
        return // collateralShare.balanceOf(msg.sender) == 0 ? 0 :
        ( (borrowShare.balanceOf(user) + accruedInterest(user)) * borrowShare.convertToAssets(2**100) ) / 
        ( collateralShare.balanceOf(user) * collateralShare.convertToAssets(2**100) ) * 
        100; 
        // 2**100 ~ 1T tokens. For each increace in 2**10, amount of tokens will increace in ~ 1000, assuming 'decimals' is 18.
        // e.g. 2**90 ~ 1M tokens, 2**110 ~ 1Q tokens etc. The more number is, result will be more accurate at the risk of overflow
    }
    
    function supply(uint amount) public updateIndexAndLTV() {
        collateralToken.transfer(msg.sender, address(this), amount);
        collateralShare.mint(collateralShare.previewDeposit(amount), msg.sender);
    }

    function borrow(uint amount) public updateIndexAndLTV() {
        borrowToken.transfer(address(this), msg.sender, amount);
        borrowShare.mint(borrowShare.previewDeposit(amount), msg.sender);
    }

    function repayPart(uint amount) public updateIndexAndLTV() {
        uint startInterest = accruedInterest(msg.sender);
        // paying only %, doesnt burn any shares
        if(amount <= startInterest){
            // transfering amount to vault and admin in 70:30 ratio
            borrowToken.transfer(msg.sender, address(vault), (amount * 7 / 10));
            borrowToken.transfer(msg.sender, admin, (amount * 3 / 10));
            // telling vault that we sended him tokens
            Vault(vault).increaseAssets(amount * 7 / 10);
            // increasing entry borrow index to reduce user dept percentage, other params used in % formula shouldn't be changed
            // formula : currentInterest = borrowShares * (currentIndex - startIndex)
            // -> (currentInterest / borrowShares) = currentIndex - startIndex
            // -> startIndex + (currentInterest / borrowShares) = currentIndex
            // -> startIndex = currentIndex - (currentInterest / borrowShares)
            // since we decreased interest, currentInterest is startInterest minus amount we payed
            // so if we payed same amount as %, formula for % will give 0
            userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex - ( (startInterest - amount) / borrowShare.balanceOf(msg.sender) );
        } 
        // paying all % + some amount of dept
        else {
            // transfering fee to vault and admin in 70:30 ratio
            borrowToken.transfer(msg.sender, address(vault), (startInterest * 7 / 10));
            borrowToken.transfer(msg.sender, admin, (startInterest * 3 / 10));
            // telling vault that we sended him tokens
            Vault(vault).increaseAssets(startInterest * 7 / 10);
            // clearing dept percentage
            userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex;
            // calculating amount of tokens which will reduce dept body
            // if we payed more than we supposed to, function will revert when solidity tries to assign negative value to UINT
            uint payment = amount - startInterest;
            // transfering tokens to market and burning shares to reduce dept
            borrowToken.transfer(msg.sender, address(this), payment);
            borrowShare.burn(msg.sender, borrowShare.previewWithdraw(payment));
        }
    }

    function repayFull() public updateIndexAndLTV() {
        // dept percentage
        uint interest = accruedInterest(msg.sender);
        // transfering fee to vault and admin in 70:30 ratio (or 7:3)
        borrowToken.transfer(msg.sender, address(vault), (interest * 7 / 10));
        borrowToken.transfer(msg.sender, admin, (interest * 3 / 10));
        // telling vault that we sended him tokens
        Vault(vault).increaseAssets(interest * 7 / 10);
        // clearing dept percentage
        userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex;
        // dept itself
        uint payment = borrowShare.maxWithdraw(msg.sender);
        // transfering tokens to market AND burning all shares
        borrowToken.transfer(msg.sender, address(this), payment);
        borrowShare.burn(msg.sender, borrowShare.previewWithdraw(payment));
        lastAccureBlock = block.number;
    }

    function withdrawPart(uint amount) public updateIndexAndLTV() {
        collateralToken.transfer(address(this), msg.sender, amount);
        collateralShare.burn(msg.sender, collateralShare.previewWithdraw(amount));
    }

    function withdrawFull() public updateIndexAndLTV() {
        uint amount = collateralShare.maxWithdraw(msg.sender);
        collateralToken.transfer(address(this), msg.sender, amount);
        collateralShare.burn(msg.sender, collateralShare.previewWithdraw(amount));
    }
}