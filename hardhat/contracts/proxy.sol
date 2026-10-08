// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "./tokens.sol";

contract MyProxy is TransparentUpgradeableProxy{

    // same params order as Marketuint64 version;
    uint64 version;
    string title;
    uint LLTV;
    uint blocksPerYear;
    uint lastAccureBlock;
    uint currentBorrowIndex;
    uint InterestRate;
    address vault;
    address admin;
    uint borrowPrice;
    uint collateralPrice;
    uint WAD;
    Token collateralToken;
    Token borrowToken;
    Share collateralShare;
    Share borrowShare;
    mapping (address => uint) public userBorrowIndexAtEntry;

    constructor(address impl, bytes memory data) TransparentUpgradeableProxy(impl, msg.sender, data) payable {}

    receive() external payable {}

}