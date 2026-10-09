// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Market} from "./markets.sol";
import {MyProxy} from "./proxy.sol";
import {Vault} from "./vaults.sol";
import {USDC, UCDC, PryUSD, Token, Share} from "./tokens.sol";
import {Test} from "forge-std/Test.sol";

contract MarketTest is Test {
    address adr1;
    address adr2;
    address adr3;
    Market market1;
    Market market2;
    Market market3;
    Token usdc;
    Token pryusd;
    Token ucdc;
    Vault vault1;

    function createMarket(
        string memory title, uint LLTV, uint interestRate, uint borrowPrice, uint collateralPrice, uint adminFee, uint64 version
    ) public returns(Market){
        return Market(
            address(new MyProxy(
                address(new Market()), 
                abi.encodeCall(
                    Market.init, 
                    (title, LLTV, address(vault1), borrowPrice, collateralPrice, adminFee, interestRate, ucdc, usdc, version)
                )
            ))
        );
    }

    function setUp() public {
        setUp_(0x8E063311dc0eD67c2bcDd876C1C5fF54aC7403a5, 0xB1F5b4DD4E87C1B43edb6CFac42ce05b6c826841, 0xBD396DC24701a840b1582f3FC613c897F74d0167);
    }

    function setUp_(address adr1_, address adr2_, address adr3_) public { 
        adr1 = adr1_;
        adr2 = adr2_;
        adr3 = adr3_;
        usdc    = new USDC  (adr1, adr2, adr3);
        pryusd  = new PryUSD(adr1, adr2, adr3);
        ucdc    = new UCDC  (adr1, adr2, adr3);
        vault1  = new Vault (usdc, "Vault1");
        market1 = createMarket("Market1", 75, 317, 100, 100, 30, 1);
        market2 = createMarket("Market2", 80, 500, 100, 100, 30, 1);
        market3 = createMarket("Market3", 85, 350, 100, 100, 30, 1);
        vault1.destributeToMarkets(address(market1), address(market2), address(market3));
    }

    // test group 1: users and markets have needed tokens (dont need to check vault)

    function test_marketsHaveBorrowBalance() public view {
        assertGt(usdc.balanceOf(address(market1)), 0, "market1 hasn't tokens");
        assertGt(usdc.balanceOf(address(market2)), 0, "market2 hasn't tokens");
        assertGt(usdc.balanceOf(address(market3)), 0, "market3 hasn't tokens");
    }

    function test_usersHaveCollateralBalance() public view {
        assertGt(ucdc.balanceOf(adr1), 0, "adr1 doesnt have balance");
        assertGt(ucdc.balanceOf(adr2), 0, "adr2 doesnt have balance");
        assertGt(ucdc.balanceOf(adr3), 0, "adr3 doesnt have balance");
    }

    function test_usersHaveBorrowBalance() public view {
        assertGt(usdc.balanceOf(adr1), 0, "adr1 doesnt have balance");
        assertGt(usdc.balanceOf(adr2), 0, "adr2 doesnt have balance");
        assertGt(usdc.balanceOf(adr3), 0, "adr3 doesnt have balance");
    }

    // after this point we are sure that all users and markets have needed tokens

    // test group 2: checking that users/markets dont have tokens that are not supposed to be at the start

    function test_sharesInMarketsHaveCorrectAssets() public view {
        (,,,,,,,,,,, address collateralShare1, address borrowShare1,,) = market1.getMarket();
        (,,,,,,,,,,, address collateralShare2, address borrowShare2,,) = market2.getMarket();
        (,,,,,,,,,,, address collateralShare3, address borrowShare3,,) = market3.getMarket();

        // all collateral shares are supposed to have ucdc as asset token
        assertEq(Share(collateralShare1).asset(), address(ucdc), "market1 was supposed to have colShare asset as coltoken");
        assertEq(Share(collateralShare2).asset(), address(ucdc), "market2 was supposed to have colShare asset as coltoken");
        assertEq(Share(collateralShare3).asset(), address(ucdc), "market3 was supposed to have colShare asset as coltoken");

        // all borrow shares are supposed to have usdc as asset token
        assertEq(Share(borrowShare1).asset(), address(usdc), "market1 was supposed to have borShare asset as borToken");
        assertEq(Share(borrowShare2).asset(), address(usdc), "market2 was supposed to have borShare asset as borToken");
        assertEq(Share(borrowShare3).asset(), address(usdc), "market3 was supposed to have borShare asset as borToken");
    }

    function test_marketsGetNotEqShares() public view {
        (,,,,,,,,,,, address collateralShare1, address borrowShare1,,) = market1.getMarket();
        (,,,,,,,,,,, address collateralShare2, address borrowShare2,,) = market2.getMarket();
        (,,,,,,,,,,, address collateralShare3, address borrowShare3,,) = market3.getMarket();

        // colShare1 is not supposed to be eq to any other share
        assertNotEq(collateralShare1, collateralShare2, "colShare1 and colShare2 are supposed to be not equal");
        assertNotEq(collateralShare1, collateralShare3, "colShare1 and colShare3 are supposed to be not equal");
        assertNotEq(collateralShare1, borrowShare1, "colShare1 and borshare1 are supposed to be not equal");
        assertNotEq(collateralShare1, borrowShare2, "colShare1 and borshare2 are supposed to be not equal");
        assertNotEq(collateralShare1, borrowShare3, "colShare1 and borshare3 are supposed to be not equal");

        // colShare2 is not supposed to be eq to any other share(checked colShare1)
        assertNotEq(collateralShare2, collateralShare3, "colShare2 and colShare3 are supposed to be not equal");
        assertNotEq(collateralShare2, borrowShare1, "colShare2 and borShare1 are supposed to be not equal");
        assertNotEq(collateralShare2, borrowShare2, "colShare2 and borShare2 are supposed to be not equal");
        assertNotEq(collateralShare2, borrowShare3, "colShare2 and borShare3 are supposed to be not equal");

        // colShare3 is not supposed to be eq to any other share(checked prev shares...)
        assertNotEq(collateralShare3, borrowShare1, "colShare3 and borShare1 are supposed to be not equal");
        assertNotEq(collateralShare3, borrowShare2, "colShare3 and borShare2 are supposed to be not equal");
        assertNotEq(collateralShare3, borrowShare3, "colShare3 and borShare3 are supposed to be not equal");

        // checking borShare1
        assertNotEq(borrowShare1, borrowShare2, "borShare1 and borShare2 are supposed to be not equal");
        assertNotEq(borrowShare1, borrowShare3, "borShare1 and borShare3 are supposed to be not equal");

        // and borShare2 as last check
        assertNotEq(borrowShare2, borrowShare3, "borShare2 and borShare3 are supposed to be not equal");
    }

    function test_marketsDontHaveAnyShares() public view {
        (,,,,,,,,,,, address collateralShare1, address borrowShare1,,) = market1.getMarket();
        (,,,,,,,,,,, address collateralShare2, address borrowShare2,,) = market2.getMarket();
        (,,,,,,,,,,, address collateralShare3, address borrowShare3,,) = market3.getMarket();

        // all markets was supposed to not have colShare1
        assertEq(Share(collateralShare1).balanceOf(address(market1)), 0, "market1 was supposed to not have colShare1");
        assertEq(Share(collateralShare1).balanceOf(address(market2)), 0, "market2 was supposed to not have colShare1");
        assertEq(Share(collateralShare1).balanceOf(address(market3)), 0, "market3 was supposed to not have colShare1");

        // all markets was supposed to not have colShare2
        assertEq(Share(collateralShare2).balanceOf(address(market1)), 0, "market1 was supposed to not have colShare2");
        assertEq(Share(collateralShare2).balanceOf(address(market2)), 0, "market2 was supposed to not have colShare2");
        assertEq(Share(collateralShare2).balanceOf(address(market3)), 0, "market3 was supposed to not have colShare2");

        // all markets was supposed to not have colShare3
        assertEq(Share(collateralShare3).balanceOf(address(market1)), 0, "market3 was supposed to not have colShare3");
        assertEq(Share(collateralShare3).balanceOf(address(market2)), 0, "market2 was supposed to not have colShare3");
        assertEq(Share(collateralShare3).balanceOf(address(market3)), 0, "market3 was supposed to not have colShare3");
        
        // all markets was supposed to not have borShare1
        assertEq(Share(borrowShare1).balanceOf(address(market1)), 0, "market1 was supposed to not have borShare1");
        assertEq(Share(borrowShare1).balanceOf(address(market2)), 0, "market2 was supposed to not have borShare1");
        assertEq(Share(borrowShare1).balanceOf(address(market3)), 0, "market3 was supposed to not have borShare1");

        // all markets was supposed to not have borShare2
        assertEq(Share(borrowShare2).balanceOf(address(market1)), 0, "market1 was supposed to not have borShare2");
        assertEq(Share(borrowShare2).balanceOf(address(market2)), 0, "market2 was supposed to not have borShare2");
        assertEq(Share(borrowShare2).balanceOf(address(market3)), 0, "market3 was supposed to not have borShare2");

        // all markets was supposed to not have borShare3
        assertEq(Share(borrowShare3).balanceOf(address(market1)), 0, "market1 was supposed to not have borShare3");
        assertEq(Share(borrowShare3).balanceOf(address(market2)), 0, "market2 was supposed to not have borShare3");
        assertEq(Share(borrowShare3).balanceOf(address(market3)), 0, "market3 was supposed to not have borShare3");
    }

    function test_usersDontHaveAnyShares() public view {
        (,,,,,,,,,,, address collateralShare1, address borrowShare1,,) = market1.getMarket();
        (,,,,,,,,,,, address collateralShare2, address borrowShare2,,) = market2.getMarket();
        (,,,,,,,,,,, address collateralShare3, address borrowShare3,,) = market3.getMarket();

        // all users was supposed to not have colShare1
        assertEq(Share(collateralShare1).balanceOf(adr1), 0, "adr1 was supposed to not have colShare1");
        assertEq(Share(collateralShare1).balanceOf(adr2), 0, "adr2 was supposed to not have colShare1");
        assertEq(Share(collateralShare1).balanceOf(adr3), 0, "adr3 was supposed to not have colShare1");

        // all users was supposed to not have colShare2
        assertEq(Share(collateralShare2).balanceOf(adr1), 0, "adr1 was supposed to not have colShare2");
        assertEq(Share(collateralShare2).balanceOf(adr2), 0, "adr2 was supposed to not have colShare2");
        assertEq(Share(collateralShare2).balanceOf(adr3), 0, "adr3 was supposed to not have colShare2");

        // all users was supposed to not have colShare3
        assertEq(Share(collateralShare3).balanceOf(adr1), 0, "adr1 was supposed to not have colShare3");
        assertEq(Share(collateralShare3).balanceOf(adr2), 0, "adr2 was supposed to not have colShare3");
        assertEq(Share(collateralShare3).balanceOf(adr3), 0, "adr3 was supposed to not have colShare3");
        
        // all users was supposed to not have borShare1
        assertEq(Share(borrowShare1).balanceOf(adr1), 0, "adr1 was supposed to not have borShare1");
        assertEq(Share(borrowShare1).balanceOf(adr2), 0, "adr2 was supposed to not have borShare1");
        assertEq(Share(borrowShare1).balanceOf(adr3), 0, "adr3 was supposed to not have borShare1");

        // all users was supposed to not have borShare2
        assertEq(Share(borrowShare2).balanceOf(adr1), 0, "adr1 was supposed to not have borShare2");
        assertEq(Share(borrowShare2).balanceOf(adr2), 0, "adr2 was supposed to not have borShare2");
        assertEq(Share(borrowShare2).balanceOf(adr3), 0, "adr3 was supposed to not have borShare2");

        // all users was supposed to not have borShare3
        assertEq(Share(borrowShare3).balanceOf(adr1), 0, "adr1 was supposed to not have borShare3");
        assertEq(Share(borrowShare3).balanceOf(adr2), 0, "adr2 was supposed to not have borShare3");
        assertEq(Share(borrowShare3).balanceOf(adr3), 0, "adr3 was supposed to not have borShare3");
    }

    function marketsDontHaveCollateralTokens() public view {
        assertEq(ucdc.balanceOf(address(market1)), 0, "market1 was supposed to not have collateral tokens");
        assertEq(ucdc.balanceOf(address(market2)), 0, "market1 was supposed to not have collateral tokens");
        assertEq(ucdc.balanceOf(address(market3)), 0, "market1 was supposed to not have collateral tokens");
    }

    // after this point we are sure:
    // - shares have correct assets
    // - all shares are different
    // - markets dont have any shares
    // - markets dont have collateral tokens
    // - users dont have any shares

    // test group 3: testing market functionality with 1 user (using market1)

    function test_supplyWithoutBorrow() public {
        uint amountToSend = 1000e18;
        uint userStartBalance = ucdc.balanceOf(adr1);

        vm.startPrank(adr1);

        market1.supply(amountToSend);

        (,,,,,,,,,,,,,, uint marColTokBal) = market1.getMarket();
        (uint userBorrowIndex, uint userColShareBal, , uint userLTV, , uint userColTokBal) = market1.getUserMarket();

        // market must receive some collateral tokens (increased balance)
        assertGt(marColTokBal, 0, "market hasn't received colTokens");
        // user supposed to send some tokens (decreased balance)
        assertLe(userColTokBal, userStartBalance, "user hasn't sent collateral colTokens");
        // market must receive collateral tokens as much as user sent
        assertEq(marColTokBal, amountToSend, "incorrect amount of colTokens received");
        // user must send collateral tokens as much as how decreased his balance
        assertEq(userColTokBal, userStartBalance - amountToSend, "incorrect amount of colTtokens sended");
        // user must receive some share tokens (increased balance)
        assertGt(userColShareBal, 0, "user hasn't received colShares");
        // user supposed to have collateral share as how mush he sent collateral tokens
        assertEq(userColShareBal, amountToSend, "incorrect amount of colShare minted");
        // LTV is supposed to remain 0
        assertEq(userLTV, 0, "LTV is supposed to be 0");
        // userBorrowIndex supposed to not change
        assertEq(userBorrowIndex, 0, "userBorrowIndex supposed to be 0");
        
        vm.stopPrank();
    }

    // supply works correctly, don't need to test correctness of function call

    function test_supplyWithBorrow_noRevert() public {
        uint supplyAmount = 1000e18;
        uint borrowAmount = 500e18;
        uint marketBorStartBalance = usdc.balanceOf(address(market1));
        uint userBorStartBalance = usdc.balanceOf(adr1);

        vm.startPrank(adr1);

        market1.supply(supplyAmount);

        market1.borrow(borrowAmount);

        (,,,,,,,,,,,,, uint marBorTokBal,) = market1.getMarket();
        (uint userBorrowIndex, , uint userBorShareBal , uint userLTV, uint userBorTokBal,) = market1.getUserMarket();

        // market supposed to send some tokens
        assertLe(marBorTokBal, marketBorStartBalance, "market was supposed to send borTokens");
        // user supposed to receive some tokens 
        assertGt(userBorTokBal, userBorStartBalance, "user was supposed to receive borTokens");
        // market supposed to send correct amount of tokens
        assertEq(marBorTokBal, marketBorStartBalance - borrowAmount, "market sent incorrect amount of tokens");
        // user supposed to receive correct amount of tokens
        assertEq(userBorTokBal, userBorStartBalance + borrowAmount, "user received incorrect amount of tokens");
        // user supposed to receive some amount of shares
        assertNotEq(userBorShareBal, 0, "user supposed to receive borShares");
        // user supposed to receive correct amount of shares
        assertEq(userBorShareBal, borrowAmount, "user received incorrect amount of borShares");
        // LTV supposed to change
        assertGt(userLTV, 0, "LTV supposed to change");
        // LTV supposed to correctly change
        assertEq(userLTV, 100 * borrowAmount / supplyAmount, "LTV supposed to correctly change");
        // userBorrowIndex supposed to change
        assertNotEq(userBorrowIndex, 0, "userBorrowIndex supposed to be 0");

        vm.stopPrank();
    }

    // borrow works correctly, dont need to test corectness of function call

}