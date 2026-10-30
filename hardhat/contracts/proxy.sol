// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "./tokens.sol";

contract MyProxy is TransparentUpgradeableProxy{

    // same params order as Market version;
    uint64 version;
    string title;
    uint256 LLTV;
    uint256 blocksPerYear;
    uint256 lastAccureBlock;
    uint256 currentBorrowIndex;
    uint256 InterestRate;
    address vault;
    uint256 adminFee; 
    uint256 liquidationCoefficient;
    uint256 borrowPrice;
    uint256 collateralPrice;
    Token collateralToken;
    Token borrowToken;
    Share collateralShare;
    Share borrowShare;
    mapping (address => uint256) public userBorrowIndexAtEntry;

    constructor(address impl, bytes memory data) TransparentUpgradeableProxy(impl, msg.sender, data) payable {}

    receive() external payable {}

}