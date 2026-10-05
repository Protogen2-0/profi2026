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

    function getProxyAdmin() public view returns(address){
        return super._proxyAdmin();
    }

    function getProxyImplementation() public view returns(address){
        return super._implementation();
    }

    function callOtherMethodBytes(bytes memory methodData) public returns(bytes memory){
        (bool success, bytes memory returnData) = getProxyImplementation().delegatecall(methodData); 
        require(success, "error while calling method (bytes)");
        return returnData;
    }

    function callOtherMethodString(string memory funcSig) public returns(bytes memory){
        (bool success, bytes memory returnData) = getProxyImplementation().delegatecall(abi.encodeWithSignature(funcSig)); 
        require(success, "error while calling method (string)");
        return returnData;
    }

    receive() external payable{}
}