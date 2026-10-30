// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Token} from "./ContactProffessional.sol";
import {Test} from "forge-std/Test.sol";

// Solidity tests are compatible with foundry, so they
// use the same syntax and offer the same functionality.

contract CounterTest is Test {

    Token token;

    address adr1;
    address adr2;
    address adr3;
    address adr4;
    address adr5;
    address adr6;
    address adr7;

    function setUp() public {
        adr1 = address(1); // privProv
        adr2 = address(2); // pubProv
        adr3 = address(3); // inv1
        adr4 = address(4); // inv2
        adr5 = address(5); // bf
        adr6 = address(6); // owner
        vm.startPrank(adr6);
        token = new Token(adr1, adr2, adr3, adr4, adr5);
        vm.stopPrank();
    }

    function checkEq(address user, string memory login, string memory password) public {
        vm.startPrank(adr6);
        Token.User memory userFromFunction = token.signIn(login, password);
        Token.User memory userFromMap = token.getUserData(user);
        assertEq(userFromFunction.login, userFromMap.login, "login");
        assertEq(userFromFunction.wallet, userFromMap.wallet, "wallet");
        assertEq(userFromFunction.seedTokens, userFromMap.seedTokens, "seedTokens");
        assertEq(userFromFunction.privateTokens, userFromMap.privateTokens, "privateTokens");
        assertEq(userFromFunction.publicTokens, userFromMap.publicTokens, "publicTokens");
        assertEq(userFromFunction.whitelist, userFromMap.whitelist, "whitelist");
        vm.stopPrank();
    }

    // testing that owner is logged in

    function test_signInRightPassword() public {
        checkEq(adr6, "owner", "123");
    }

    // testing that other accounts are logged in

    function test_sighInOtherAccounts() public {
        checkEq(adr1, "privProv", "123");
        checkEq(adr2, "pubProv", "123");
        checkEq(adr3, "inv1", "123");
        checkEq(adr4, "inv2", "123");
        checkEq(adr5, "bf", "123");
    }

    function test_register() public {
        adr7 = address(7);
        vm.startPrank(adr7);
        token.signUp("igor", "123");
        vm.stopPrank();
        checkEq(adr7, "igor", "123");
    }

    function test_wrongPassword() public {
        vm.startPrank(adr6);
        vm.expectRevert();
        token.signIn("privProv", "1234");
        vm.stopPrank();
    }

    function test_buyToken_0_phase3() public {
        vm.startPrank(adr1);
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.buyToken(0);
        vm.stopPrank();
    }

    function test_buyToken_0_phase2() public {
        vm.startPrank(adr1);
        token.addMinute();
        token.addMinute();
        token.addMinute();
        token.addMinute();
        toketoken.addMinutbuyToken(0);
        vm.stopPrank();
    }

    function test_buyToken_0_phase1() public {
        vm.startPrank(adr1);
        vm.expectRevert();
        token.buyToken(0);
        vm.stopPrank();
    }

}