// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./tokens.sol";

contract Vault is ERC4626 {
    Token assetToken;
    uint8 APY; // 10% instead of 0.1
    string title;
    uint256 assets;

    constructor(Token assetToken_, string memory title_, string memory shareName) ERC4626(IERC20(assetToken_)) ERC20(shareName, assetToken_.symbol()) {
        title = title_;
        assetToken = assetToken_;
        assetToken.mint(address(this), 10000 * 10 ** assetToken.decimals());
        APY = 10;
    }

    function totalAssets() public view override returns(uint256){
        return assets;
    }

    function destributeToMarkets(address proxyMarket1, address proxyMarket2, address proxyMarket3) public {
        uint256 transferAmount = assetToken.balanceOf(address(this)) / 6;
        assetToken.transfer(address(this), proxyMarket1, transferAmount);
        assetToken.transfer(address(this), proxyMarket2, transferAmount);
        assetToken.transfer(address(this), proxyMarket3, transferAmount);
    }

    function deposit(uint256 amount) public {
        if(amount < 10 * 10 ** assetToken.decimals()) // minimal deposit 10 asset tokens
            revert("minimal deposit is 10 asset tokens");
        assets += amount;
        assetToken.transfer(msg.sender, address(this), amount);
        _mint(msg.sender, previewDeposit(amount));
    }

    function withdrawPart(uint256 amount) public {
        if(amount > assets)
            revert("number of available assets is lower then requested amount");
        uint256 shares = previewWithdraw(amount);
        if(shares > balanceOf(msg.sender))
            revert("user is withdrawing more than he deposited");
        assets -= amount;
        assetToken.transfer(address(this), msg.sender, amount);
        _burn(msg.sender, shares);
    }

    function withdrawFull() public {
        uint256 shares = balanceOf(msg.sender);
        uint256 userAssets = previewRedeem(shares);
        if(userAssets > assets)
            revert("number of available assets is lower then requested amount");
        assets -= userAssets;
        assetToken.transfer(address(this), msg.sender, userAssets);
        _burn(msg.sender, shares);
    }

    function increaseAssets(uint256 amount) public {
        assets += amount;
    }

    function getVault() public view returns(address, uint256, string memory, uint256, uint256, uint256){
        return(address(assetToken), APY, title, assets, totalSupply(), assetToken.balanceOf(address(this)));
    }
    
    function getUserVault() public view returns(uint256, uint256){
        return(assetToken.balanceOf(msg.sender), balanceOf(msg.sender));
    }
}