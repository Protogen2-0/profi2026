'npx hardhat clean' running (wd: /mnt/c/Users/User1.11/Desktop/profi2026/hardhat)
'npx hardhat clean --global' running (wd: /mnt/c/Users/User1.11/Desktop/profi2026/hardhat)
Problem executing hardhat: npm notice run npx
npm notice run hardhat console --no-compile
◇ injected env (6) from .env

'npx hardhat compile --force' running (wd: /mnt/c/Users/User1.11/Desktop/profi2026/hardhat)
**THIS CHECKLIST IS NOT COMPLETE**. Use `--show-ignored-findings` to show all the results.
Summary
 - [incorrect-exp](#incorrect-exp) (1 results) (High)
 - [incorrect-return](#incorrect-return) (1 results) (High)
 - [msg-value-in-nonpayable](#msg-value-in-nonpayable) (1 results) (High)
 - [incorrect-shift](#incorrect-shift) (1 results) (High)
 - [shadowing-state](#shadowing-state) (1 results) (High)
 - [divide-before-multiply](#divide-before-multiply) (9 results) (Medium)
 - [incorrect-equality](#incorrect-equality) (3 results) (Medium)
 - [reentrancy-no-eth](#reentrancy-no-eth) (2 results) (Medium)
 - [uninitialized-local](#uninitialized-local) (6 results) (Medium)
 - [unused-return](#unused-return) (25 results) (Medium)
 - [shadowing-local](#shadowing-local) (5 results) (Low)
 - [events-maths](#events-maths) (2 results) (Low)
 - [missing-zero-check](#missing-zero-check) (5 results) (Low)
 - [incorrect-modifier](#incorrect-modifier) (2 results) (Low)
 - [reentrancy-benign](#reentrancy-benign) (7 results) (Low)
 - [reentrancy-events](#reentrancy-events) (7 results) (Low)
 - [assembly](#assembly) (411 results) (Informational)
 - [boolean-equal](#boolean-equal) (2 results) (Informational)
 - [pragma](#pragma) (1 results) (Informational)
 - [solc-version](#solc-version) (9 results) (Informational)
 - [low-level-calls](#low-level-calls) (9 results) (Informational)
 - [naming-convention](#naming-convention) (112 results) (Informational)
 - [redundant-statements](#redundant-statements) (1 results) (Informational)
 - [too-many-digits](#too-many-digits) (2 results) (Informational)
 - [unimplemented-functions](#unimplemented-functions) (1 results) (Informational)
 - [unindexed-event-address](#unindexed-event-address) (5 results) (Informational)
 - [unused-state](#unused-state) (24 results) (Informational)
 - [constable-states](#constable-states) (17 results) (Optimization)
 - [immutable-states](#immutable-states) (2 results) (Optimization)
## incorrect-exp
Impact: High
Confidence: Medium
 - [ ] ID-0
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) has bitwise-xor operator ^ instead of the exponentiation operator **: 
	 - [inverse = (3 * denominator) ^ 2](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L259)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


## incorrect-return
Impact: High
Confidence: Medium
 - [ ] ID-1
[TransparentUpgradeableProxy._fallback()](node_modules/@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol#L95-L105) calls [Proxy._fallback()](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L58-L60) which halt the execution [return(uint256,uint256)(0x00,returndatasize()())](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L42)

node_modules/@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol#L95-L105


## msg-value-in-nonpayable
Impact: High
Confidence: High
 - [ ] ID-2
[ERC1967Utils._checkNonPayable()](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L172-L176) uses msg.value but is not reachable from any payable function

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L172-L176


## incorrect-shift
Impact: High
Confidence: High
 - [ ] ID-3
[stdStorageSafe.getMaskByOffsets(uint256,uint256)](node_modules/forge-std/src/StdStorage.sol#L340-L346) contains an incorrect shift operation: [mask = 1 << 256 - offsetRight + offsetLeft - 1 << offsetRight](node_modules/forge-std/src/StdStorage.sol#L344)

node_modules/forge-std/src/StdStorage.sol#L340-L346


## shadowing-state
Impact: High
Confidence: High
 - [ ] ID-4
[StdCheats.vm](node_modules/forge-std/src/StdCheats.sol#L672) shadows:
	- [StdCheatsSafe.vm](node_modules/forge-std/src/StdCheats.sol#L9)

node_modules/forge-std/src/StdCheats.sol#L672


## divide-before-multiply
Impact: Medium
Confidence: Medium
 - [ ] ID-5
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) performs a multiplication on the result of a division:
	- [low = low / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L247)
	- [result = low * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L274)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


 - [ ] ID-6
[Math.invMod(uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L317-L363) performs a multiplication on the result of a division:
	- [quotient = gcd / remainder](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L339)
	- [(gcd,remainder) = (remainder,gcd - remainder * quotient)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L341-L348)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L317-L363


 - [ ] ID-7
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L244)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L268)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


 - [ ] ID-8
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L244)
	- [inverse = (3 * denominator) ^ 2](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L259)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


 - [ ] ID-9
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L244)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L266)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


 - [ ] ID-10
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L244)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L267)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


 - [ ] ID-11
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L244)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L264)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


 - [ ] ID-12
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L244)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L263)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


 - [ ] ID-13
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) performs a multiplication on the result of a division:
	- [denominator = denominator / twos](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L244)
	- [inverse *= 2 - denominator * inverse](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L265)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


## incorrect-equality
Impact: Medium
Confidence: High
 - [ ] ID-14
[Market.borrow(uint256)](contracts/markets.sol#L102-L106) uses a dangerous strict equality:
	- [borrowShare.balanceOf(msg.sender) == 0](contracts/markets.sol#L103)

contracts/markets.sol#L102-L106


 - [ ] ID-15
[Market.LTV(address)](contracts/markets.sol#L90-L95) uses a dangerous strict equality:
	- [borrowShare.balanceOf(user) == 0](contracts/markets.sol#L91)

contracts/markets.sol#L90-L95


 - [ ] ID-16
[Market.LTV(address)](contracts/markets.sol#L90-L95) uses a dangerous strict equality:
	- [collateralShare.balanceOf(user) == 0](contracts/markets.sol#L92)

contracts/markets.sol#L90-L95


## reentrancy-no-eth
Impact: Medium
Confidence: Medium
 - [ ] ID-17
Reentrancy in [Vault.withdrawFull()](contracts/vaults.sol#L49-L57):
	External calls:
	- [assetToken.transfer(address(this),msg.sender,userAssets)](contracts/vaults.sol#L54)
	State variables written after the call(s):
	- [_burn(msg.sender,shares)](contracts/vaults.sol#L55)
		- [_balances[from] = fromBalance - value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L187)
		- [_balances[to] += value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L199)
	[ERC20._balances](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L30) can be used in cross function reentrancies:
	- [ERC20._update(address,address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L176-L204)
	- [ERC20.balanceOf(address)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L87-L89)
	- [_burn(msg.sender,shares)](contracts/vaults.sol#L55)
		- [_totalSupply += value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L179)
		- [_totalSupply -= value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L194)
	[ERC20._totalSupply](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L34) can be used in cross function reentrancies:
	- [ERC20._update(address,address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L176-L204)
	- [ERC20.totalSupply()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L82-L84)
	- [assets -= userAssets](contracts/vaults.sol#L56)
	[Vault.assets](contracts/vaults.sol#L10) can be used in cross function reentrancies:
	- [Vault.deposit(uint256)](contracts/vaults.sol#L30-L36)
	- [Vault.getVault()](contracts/vaults.sol#L63-L65)
	- [Vault.increaseAssets(uint256)](contracts/vaults.sol#L59-L61)
	- [Vault.totalAssets()](contracts/vaults.sol#L19-L21)
	- [Vault.withdrawFull()](contracts/vaults.sol#L49-L57)
	- [Vault.withdrawPart(uint256)](contracts/vaults.sol#L38-L47)

contracts/vaults.sol#L49-L57


 - [ ] ID-18
Reentrancy in [Vault.withdrawPart(uint256)](contracts/vaults.sol#L38-L47):
	External calls:
	- [assetToken.transfer(address(this),msg.sender,amount)](contracts/vaults.sol#L44)
	State variables written after the call(s):
	- [_burn(msg.sender,shares)](contracts/vaults.sol#L45)
		- [_balances[from] = fromBalance - value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L187)
		- [_balances[to] += value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L199)
	[ERC20._balances](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L30) can be used in cross function reentrancies:
	- [ERC20._update(address,address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L176-L204)
	- [ERC20.balanceOf(address)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L87-L89)
	- [_burn(msg.sender,shares)](contracts/vaults.sol#L45)
		- [_totalSupply += value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L179)
		- [_totalSupply -= value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L194)
	[ERC20._totalSupply](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L34) can be used in cross function reentrancies:
	- [ERC20._update(address,address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L176-L204)
	- [ERC20.totalSupply()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L82-L84)
	- [assets -= amount](contracts/vaults.sol#L46)
	[Vault.assets](contracts/vaults.sol#L10) can be used in cross function reentrancies:
	- [Vault.deposit(uint256)](contracts/vaults.sol#L30-L36)
	- [Vault.getVault()](contracts/vaults.sol#L63-L65)
	- [Vault.increaseAssets(uint256)](contracts/vaults.sol#L59-L61)
	- [Vault.totalAssets()](contracts/vaults.sol#L19-L21)
	- [Vault.withdrawFull()](contracts/vaults.sol#L49-L57)
	- [Vault.withdrawPart(uint256)](contracts/vaults.sol#L38-L47)

contracts/vaults.sol#L38-L47


## uninitialized-local
Impact: Medium
Confidence: Medium
 - [ ] ID-19
[StdCheatsSafe.rawToConvertedEIPTx1559(StdCheatsSafe.RawTx1559).transaction](node_modules/forge-std/src/StdCheats.sol#L402) is a local variable never initialized

node_modules/forge-std/src/StdCheats.sol#L402


 - [ ] ID-20
[StdCheatsSafe.readEIP1559ScriptArtifact(string).artifact](node_modules/forge-std/src/StdCheats.sol#L380) is a local variable never initialized

node_modules/forge-std/src/StdCheats.sol#L380


 - [ ] ID-21
[StdCheatsSafe.rawToConvertedEIP1559Detail(StdCheatsSafe.RawTx1559Detail).txDetail](node_modules/forge-std/src/StdCheats.sol#L420) is a local variable never initialized

node_modules/forge-std/src/StdCheats.sol#L420


 - [ ] ID-22
[stdStorageSafe.root(StdStorage).root_slot](node_modules/forge-std/src/StdStorage.sol#L287) is a local variable never initialized

node_modules/forge-std/src/StdStorage.sol#L287


 - [ ] ID-23
[stdStorageSafe._bytesToBytes32(bytes,uint256).out](node_modules/forge-std/src/StdStorage.sol#L303) is a local variable never initialized

node_modules/forge-std/src/StdStorage.sol#L303


 - [ ] ID-24
[StdCheatsSafe.rawToConvertedReceipt(StdCheatsSafe.RawReceipt).receipt](node_modules/forge-std/src/StdCheats.sol#L477) is a local variable never initialized

node_modules/forge-std/src/StdCheats.sol#L477


## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-25
[StdUtils.getTokenBalances(address,address[])](node_modules/forge-std/src/StdUtils.sol#L173-L200) ignores return value by [(None,returnData) = StdConstants.MULTICALL3_ADDRESS.aggregate(calls)](node_modules/forge-std/src/StdUtils.sol#L193)

node_modules/forge-std/src/StdUtils.sol#L173-L200


 - [ ] ID-26
[MarketTest.test_marketsGetNotEqShares()](contracts/markets.t.sol#L108-L137) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare3,borrowShare3,None,None) = market3.getMarket()](contracts/markets.t.sol#L111)

contracts/markets.t.sol#L108-L137


 - [ ] ID-27
[stdStorageSafe.root(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L281-L300) ignores return value by [(found,None,parent_slot) = vm.getMappingKeyAndParentOf(who,bytes32(root_slot))](node_modules/forge-std/src/StdStorage.sol#L297)

node_modules/forge-std/src/StdStorage.sol#L281-L300


 - [ ] ID-28
[ERC4626._tryGetAssetDecimals(IERC20)](node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol#L108-L120) ignores return value by [(success,returnedDecimals,None) = LowLevelCall.staticcallReturn64Bytes(address(asset_),abi.encodeCall(IERC20Metadata.decimals,()))](node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol#L110-L113)

node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol#L108-L120


 - [ ] ID-29
[MarketTest.test_supplyWithBorrow_noRevert()](contracts/markets.t.sol#L259-L294) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,None,None,marBorTokBal,None) = market1.getMarket()](contracts/markets.t.sol#L271)

contracts/markets.t.sol#L259-L294


 - [ ] ID-30
[MarketTest.test_marketsGetNotEqShares()](contracts/markets.t.sol#L108-L137) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare1,borrowShare1,None,None) = market1.getMarket()](contracts/markets.t.sol#L109)

contracts/markets.t.sol#L108-L137


 - [ ] ID-31
[MarketTest.test_marketsDontHaveAnyShares()](contracts/markets.t.sol#L139-L173) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare3,borrowShare3,None,None) = market3.getMarket()](contracts/markets.t.sol#L142)

contracts/markets.t.sol#L139-L173


 - [ ] ID-32
[StdCheatsSafe.isFork()](node_modules/forge-std/src/StdCheats.sol#L601-L605) ignores return value by [vm.activeFork()](node_modules/forge-std/src/StdCheats.sol#L602-L604)

node_modules/forge-std/src/StdCheats.sol#L601-L605


 - [ ] ID-33
[MarketTest.test_usersDontHaveAnyShares()](contracts/markets.t.sol#L175-L209) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare2,borrowShare2,None,None) = market2.getMarket()](contracts/markets.t.sol#L177)

contracts/markets.t.sol#L175-L209


 - [ ] ID-34
[MarketTest.test_marketsDontHaveAnyShares()](contracts/markets.t.sol#L139-L173) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare1,borrowShare1,None,None) = market1.getMarket()](contracts/markets.t.sol#L140)

contracts/markets.t.sol#L139-L173


 - [ ] ID-35
[ERC4626Upgradeable._tryGetAssetDecimals(IERC20)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L128-L140) ignores return value by [(success,returnedDecimals,None) = LowLevelCall.staticcallReturn64Bytes(address(asset_),abi.encodeCall(IERC20Metadata.decimals,()))](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L130-L133)

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L128-L140


 - [ ] ID-36
[MarketTest.test_marketsGetNotEqShares()](contracts/markets.t.sol#L108-L137) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare2,borrowShare2,None,None) = market2.getMarket()](contracts/markets.t.sol#L110)

contracts/markets.t.sol#L108-L137


 - [ ] ID-37
[stdStorageSafe.find(StdStorage,bool)](node_modules/forge-std/src/StdStorage.sol#L108-L172) ignores return value by [(reads,None) = vm.accesses(address(who))](node_modules/forge-std/src/StdStorage.sol#L123)

node_modules/forge-std/src/StdStorage.sol#L108-L172


 - [ ] ID-38
[MarketTest.test_supplyWithoutBorrow()](contracts/markets.t.sol#L226-L255) ignores return value by [(userBorrowIndex,userColShareBal,None,userLTV,None,userColTokBal) = market1.getUserMarket()](contracts/markets.t.sol#L235)

contracts/markets.t.sol#L226-L255


 - [ ] ID-39
[ERC1967Utils.upgradeBeaconToAndCall(address,bytes)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L157-L166) ignores return value by [Address.functionDelegateCall(IBeacon(newBeacon).implementation(),data)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L162)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L157-L166


 - [ ] ID-40
[MarketTest.test_usersDontHaveAnyShares()](contracts/markets.t.sol#L175-L209) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare3,borrowShare3,None,None) = market3.getMarket()](contracts/markets.t.sol#L178)

contracts/markets.t.sol#L175-L209


 - [ ] ID-41
[ERC1967Utils.upgradeToAndCall(address,bytes)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L67-L76) ignores return value by [Address.functionDelegateCall(newImplementation,data)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L72)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L67-L76


 - [ ] ID-42
[MarketTest.test_supplyWithBorrow_noRevert()](contracts/markets.t.sol#L259-L294) ignores return value by [(userBorrowIndex,None,userBorShareBal,userLTV,userBorTokBal,None) = market1.getUserMarket()](contracts/markets.t.sol#L272)

contracts/markets.t.sol#L259-L294


 - [ ] ID-43
[stdStorageSafe.root(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L281-L300) ignores return value by [(found,None,parent_slot) = vm.getMappingKeyAndParentOf(who,bytes32(child))](node_modules/forge-std/src/StdStorage.sol#L289)

node_modules/forge-std/src/StdStorage.sol#L281-L300


 - [ ] ID-44
[MarketTest.test_usersDontHaveAnyShares()](contracts/markets.t.sol#L175-L209) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare1,borrowShare1,None,None) = market1.getMarket()](contracts/markets.t.sol#L176)

contracts/markets.t.sol#L175-L209


 - [ ] ID-45
[MarketTest.test_marketsDontHaveAnyShares()](contracts/markets.t.sol#L139-L173) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare2,borrowShare2,None,None) = market2.getMarket()](contracts/markets.t.sol#L141)

contracts/markets.t.sol#L139-L173


 - [ ] ID-46
[MarketTest.test_sharesInMarketsHaveCorrectAssets()](contracts/markets.t.sol#L92-L106) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare2,borrowShare2,None,None) = market2.getMarket()](contracts/markets.t.sol#L94)

contracts/markets.t.sol#L92-L106


 - [ ] ID-47
[MarketTest.test_sharesInMarketsHaveCorrectAssets()](contracts/markets.t.sol#L92-L106) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare3,borrowShare3,None,None) = market3.getMarket()](contracts/markets.t.sol#L95)

contracts/markets.t.sol#L92-L106


 - [ ] ID-48
[MarketTest.test_sharesInMarketsHaveCorrectAssets()](contracts/markets.t.sol#L92-L106) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,collateralShare1,borrowShare1,None,None) = market1.getMarket()](contracts/markets.t.sol#L93)

contracts/markets.t.sol#L92-L106


 - [ ] ID-49
[MarketTest.test_supplyWithoutBorrow()](contracts/markets.t.sol#L226-L255) ignores return value by [(None,None,None,None,None,None,None,None,None,None,None,None,None,None,marColTokBal) = market1.getMarket()](contracts/markets.t.sol#L234)

contracts/markets.t.sol#L226-L255


## shadowing-local
Impact: Low
Confidence: High
 - [ ] ID-50
[Share.constructor(address,string,string,uint8).asset](contracts/tokens.sol#L68) shadows:
	- [ERC4626.asset()](node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol#L134-L136) (function)
	- [IERC4626.asset()](node_modules/@openzeppelin/contracts/interfaces/IERC4626.sol#L30) (function)

contracts/tokens.sol#L68


 - [ ] ID-51
[Share.constructor(address,string,string,uint8).name](contracts/tokens.sol#L68) shadows:
	- [ERC20.name()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L52-L54) (function)
	- [IERC20Metadata.name()](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L15) (function)

contracts/tokens.sol#L68


 - [ ] ID-52
[Token.constructor(string,string,uint8,address,address,address).name](contracts/tokens.sol#L9) shadows:
	- [ERC20.name()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L52-L54) (function)
	- [IERC20Metadata.name()](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L15) (function)

contracts/tokens.sol#L9


 - [ ] ID-53
[Share.constructor(address,string,string,uint8).symbol](contracts/tokens.sol#L68) shadows:
	- [ERC20.symbol()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L60-L62) (function)
	- [IERC20Metadata.symbol()](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L20) (function)

contracts/tokens.sol#L68


 - [ ] ID-54
[Token.constructor(string,string,uint8,address,address,address).symbol](contracts/tokens.sol#L9) shadows:
	- [ERC20.symbol()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L60-L62) (function)
	- [IERC20Metadata.symbol()](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L20) (function)

contracts/tokens.sol#L9


## events-maths
Impact: Low
Confidence: Medium
 - [ ] ID-55
[Vault.withdrawPart(uint256)](contracts/vaults.sol#L38-L47) should emit an event for: 
	- [assets -= amount](contracts/vaults.sol#L46) 

contracts/vaults.sol#L38-L47


 - [ ] ID-56
[Vault.deposit(uint256)](contracts/vaults.sol#L30-L36) should emit an event for: 
	- [assets += amount](contracts/vaults.sol#L35) 

contracts/vaults.sol#L30-L36


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-57
[TransparentUpgradeableProxy.constructor(address,address,bytes).initialOwner](node_modules/@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol#L79) lacks a zero-check on :
		- [_admin = address(new ProxyAdmin(initialOwner))](node_modules/@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol#L80)

node_modules/@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol#L79


 - [ ] ID-58
[MarketTest.setUp_(address,address,address).adr1_](contracts/markets.t.sol#L48) lacks a zero-check on :
		- [adr1 = adr1_](contracts/markets.t.sol#L49)

contracts/markets.t.sol#L48


 - [ ] ID-59
[Market.init(string,uint256,address,uint256,uint256,uint256,uint256,uint256,Share,Share).vault_](contracts/markets.sol#L37) lacks a zero-check on :
		- [vault = vault_](contracts/markets.sol#L58)

contracts/markets.sol#L37


 - [ ] ID-60
[MarketTest.setUp_(address,address,address).adr2_](contracts/markets.t.sol#L48) lacks a zero-check on :
		- [adr2 = adr2_](contracts/markets.t.sol#L50)

contracts/markets.t.sol#L48


 - [ ] ID-61
[MarketTest.setUp_(address,address,address).adr3_](contracts/markets.t.sol#L48) lacks a zero-check on :
		- [adr3 = adr3_](contracts/markets.t.sol#L51)

contracts/markets.t.sol#L48


## incorrect-modifier
Impact: Low
Confidence: High
 - [ ] ID-62
Modifier [StdCheatsSafe.skipWhenNotForking()](node_modules/forge-std/src/StdCheats.sol#L615-L619) does not always execute _; or revert

node_modules/forge-std/src/StdCheats.sol#L615-L619


 - [ ] ID-63
Modifier [StdCheatsSafe.skipWhenForking()](node_modules/forge-std/src/StdCheats.sol#L608-L612) does not always execute _; or revert

node_modules/forge-std/src/StdCheats.sol#L608-L612


## reentrancy-benign
Impact: Low
Confidence: Medium
 - [ ] ID-64
Reentrancy in [MarketTest.setUp_(address,address,address)](contracts/markets.t.sol#L48-L66):
	External calls:
	- [vault1 = new Vault(usdc,Vault1,profiUSDC1)](contracts/markets.t.sol#L55)
	State variables written after the call(s):
	- [borShare1 = new Share(address(usdc),borShare1,BH1,18)](contracts/markets.t.sol#L57)
	- [borShare2 = new Share(address(usdc),borShare2,BH2,18)](contracts/markets.t.sol#L59)
	- [borShare3 = new Share(address(usdc),borShare3,BH3,18)](contracts/markets.t.sol#L61)
	- [colShare1 = new Share(address(ucdc),colShare1,CH1,18)](contracts/markets.t.sol#L56)
	- [colShare2 = new Share(address(ucdc),colShare2,CH2,18)](contracts/markets.t.sol#L58)
	- [colShare3 = new Share(address(ucdc),colShare3,CH3,18)](contracts/markets.t.sol#L60)
	- [market1 = createMarket(Market1,75,20,317,100,100,30,colShare1,borShare1)](contracts/markets.t.sol#L62)
	- [market2 = createMarket(Market2,80,20,500,100,100,30,colShare2,borShare2)](contracts/markets.t.sol#L63)
	- [market3 = createMarket(Market3,85,20,350,100,100,30,colShare3,borShare3)](contracts/markets.t.sol#L64)

contracts/markets.t.sol#L48-L66


 - [ ] ID-65
Reentrancy in [Market.repayPart(uint256)](contracts/markets.sol#L108-L143):
	External calls:
	- [updateIndexAndLTV(msg.sender)](contracts/markets.sol#L108)
		- [collateralToken.transfer(address(this),user,collateralBalance * liquidationCoefficient / 100)](contracts/markets.sol#L77)
		- [collateralShare.burn(user,collateralBalance)](contracts/markets.sol#L78)
		- [borrowShare.burn(user,borrowShare.balanceOf(user))](contracts/markets.sol#L79)
	State variables written after the call(s):
	- [userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex - ((startInterest - amount) / borrowShare.balanceOf(msg.sender))](contracts/markets.sol#L124)
	- [userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex](contracts/markets.sol#L131)

contracts/markets.sol#L108-L143


 - [ ] ID-66
Reentrancy in [StdCheatsSafe.noGasMetering()](node_modules/forge-std/src/StdCheats.sol#L623-L642):
	External calls:
	- [vm.pauseGasMetering()](node_modules/forge-std/src/StdCheats.sol#L624)
	State variables written after the call(s):
	- [_gasMeteringOff = true](node_modules/forge-std/src/StdCheats.sol#L633)
	- [_gasMeteringOff = false](node_modules/forge-std/src/StdCheats.sol#L639)

node_modules/forge-std/src/StdCheats.sol#L623-L642


 - [ ] ID-67
Reentrancy in [Market.borrow(uint256)](contracts/markets.sol#L102-L106):
	External calls:
	- [updateIndexAndLTV(msg.sender)](contracts/markets.sol#L102)
		- [collateralToken.transfer(address(this),user,collateralBalance * liquidationCoefficient / 100)](contracts/markets.sol#L77)
		- [collateralShare.burn(user,collateralBalance)](contracts/markets.sol#L78)
		- [borrowShare.burn(user,borrowShare.balanceOf(user))](contracts/markets.sol#L79)
	State variables written after the call(s):
	- [userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex](contracts/markets.sol#L103)

contracts/markets.sol#L102-L106


 - [ ] ID-68
Reentrancy in [StdAssertions.fail()](node_modules/forge-std/src/StdAssertions.sol#L51-L54):
	External calls:
	- [vm.store(address(vm),_FAILED_SLOT,bytes32(uint256(1)))](node_modules/forge-std/src/StdAssertions.sol#L52)
	State variables written after the call(s):
	- [_failed = true](node_modules/forge-std/src/StdAssertions.sol#L53)

node_modules/forge-std/src/StdAssertions.sol#L51-L54


 - [ ] ID-69
Reentrancy in [Vault.deposit(uint256)](contracts/vaults.sol#L30-L36):
	External calls:
	- [assetToken.transfer(msg.sender,address(this),amount)](contracts/vaults.sol#L33)
	State variables written after the call(s):
	- [_mint(msg.sender,previewDeposit(amount))](contracts/vaults.sol#L34)
		- [_balances[from] = fromBalance - value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L187)
		- [_balances[to] += value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L199)
	- [_mint(msg.sender,previewDeposit(amount))](contracts/vaults.sol#L34)
		- [_totalSupply += value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L179)
		- [_totalSupply -= value](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L194)
	- [assets += amount](contracts/vaults.sol#L35)

contracts/vaults.sol#L30-L36


 - [ ] ID-70
Reentrancy in [Market.repayFull()](contracts/markets.sol#L145-L159):
	External calls:
	- [updateIndexAndLTV(msg.sender)](contracts/markets.sol#L145)
		- [collateralToken.transfer(address(this),user,collateralBalance * liquidationCoefficient / 100)](contracts/markets.sol#L77)
		- [collateralShare.burn(user,collateralBalance)](contracts/markets.sol#L78)
		- [borrowShare.burn(user,borrowShare.balanceOf(user))](contracts/markets.sol#L79)
	State variables written after the call(s):
	- [userBorrowIndexAtEntry[msg.sender] = currentBorrowIndex](contracts/markets.sol#L150)

contracts/markets.sol#L145-L159


## reentrancy-events
Impact: Low
Confidence: Medium
 - [ ] ID-71
Reentrancy in [Vault.withdrawPart(uint256)](contracts/vaults.sol#L38-L47):
	External calls:
	- [assetToken.transfer(address(this),msg.sender,amount)](contracts/vaults.sol#L44)
	Event emitted after the call(s):
	- [Transfer(from,to,value)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L203)
		- [_burn(msg.sender,shares)](contracts/vaults.sol#L45)

contracts/vaults.sol#L38-L47


 - [ ] ID-72
Reentrancy in [stdStorageSafe.parent(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L266-L278):
	External calls:
	- [vm.startMappingRecording()](node_modules/forge-std/src/StdStorage.sol#L269)
	- [child = find(self,true).slot - field_depth](node_modules/forge-std/src/StdStorage.sol#L270)
		- [vm.store(self._target,slot,testVal)](node_modules/forge-std/src/StdStorage.sol#L61)
		- [vm.store(self._target,slot,bytes32(valueToPut))](node_modules/forge-std/src/StdStorage.sol#L74)
		- [vm.store(self._target,slot,prevSlotValue)](node_modules/forge-std/src/StdStorage.sol#L93)
		- [vm.store(self._target,slot,prevSlotValue)](node_modules/forge-std/src/StdStorage.sol#L65)
		- [vm.record()](node_modules/forge-std/src/StdStorage.sol#L121)
	Event emitted after the call(s):
	- [SlotFound(who,fsig,keccak256(bytes)(abi.encodePacked(params,field_depth)),uint256(reads[i]))](node_modules/forge-std/src/StdStorage.sol#L156)
		- [child = find(self,true).slot - field_depth](node_modules/forge-std/src/StdStorage.sol#L270)
	- [WARNING_UninitedSlot(who,uint256(reads[i]))](node_modules/forge-std/src/StdStorage.sol#L132)
		- [child = find(self,true).slot - field_depth](node_modules/forge-std/src/StdStorage.sol#L270)

node_modules/forge-std/src/StdStorage.sol#L266-L278


 - [ ] ID-73
Reentrancy in [Vault.deposit(uint256)](contracts/vaults.sol#L30-L36):
	External calls:
	- [assetToken.transfer(msg.sender,address(this),amount)](contracts/vaults.sol#L33)
	Event emitted after the call(s):
	- [Transfer(from,to,value)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L203)
		- [_mint(msg.sender,previewDeposit(amount))](contracts/vaults.sol#L34)

contracts/vaults.sol#L30-L36


 - [ ] ID-74
Reentrancy in [stdStorageSafe.find(StdStorage,bool)](node_modules/forge-std/src/StdStorage.sol#L108-L172):
	External calls:
	- [vm.record()](node_modules/forge-std/src/StdStorage.sol#L121)
	- [! checkSlotMutatesCall(self,reads[i])](node_modules/forge-std/src/StdStorage.sol#L135)
		- [vm.store(self._target,slot,testVal)](node_modules/forge-std/src/StdStorage.sol#L61)
		- [vm.store(self._target,slot,prevSlotValue)](node_modules/forge-std/src/StdStorage.sol#L65)
	- [(found,offsetLeft,offsetRight) = findOffsets(self,reads[i])](node_modules/forge-std/src/StdStorage.sol#L143)
		- [vm.store(self._target,slot,bytes32(valueToPut))](node_modules/forge-std/src/StdStorage.sol#L74)
		- [vm.store(self._target,slot,prevSlotValue)](node_modules/forge-std/src/StdStorage.sol#L93)
	Event emitted after the call(s):
	- [SlotFound(who,fsig,keccak256(bytes)(abi.encodePacked(params,field_depth)),uint256(reads[i]))](node_modules/forge-std/src/StdStorage.sol#L156)
	- [WARNING_UninitedSlot(who,uint256(reads[i]))](node_modules/forge-std/src/StdStorage.sol#L132)

node_modules/forge-std/src/StdStorage.sol#L108-L172


 - [ ] ID-75
Reentrancy in [Vault.withdrawFull()](contracts/vaults.sol#L49-L57):
	External calls:
	- [assetToken.transfer(address(this),msg.sender,userAssets)](contracts/vaults.sol#L54)
	Event emitted after the call(s):
	- [Transfer(from,to,value)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L203)
		- [_burn(msg.sender,shares)](contracts/vaults.sol#L55)

contracts/vaults.sol#L49-L57


 - [ ] ID-76
Reentrancy in [StdAssertions.assertEqCall(address,bytes,address,bytes,bool)](node_modules/forge-std/src/StdAssertions.sol#L1268-L1299):
	External calls:
	- [(successA,returnDataA) = address(targetA).call(callDataA)](node_modules/forge-std/src/StdAssertions.sol#L1275)
	- [(successB,returnDataB) = address(targetB).call(callDataB)](node_modules/forge-std/src/StdAssertions.sol#L1276)
	Event emitted after the call(s):
	- [log(Error: Calls were not equal)](node_modules/forge-std/src/StdAssertions.sol#L1287)
	- [log(Error: Calls were not equal)](node_modules/forge-std/src/StdAssertions.sol#L1294)
	- [log_named_bytes(  Left call revert data,returnDataA)](node_modules/forge-std/src/StdAssertions.sol#L1288)
	- [log_named_bytes( Right call return data,returnDataB)](node_modules/forge-std/src/StdAssertions.sol#L1289)
	- [log_named_bytes(  Left call return data,returnDataA)](node_modules/forge-std/src/StdAssertions.sol#L1295)
	- [log_named_bytes( Right call revert data,returnDataB)](node_modules/forge-std/src/StdAssertions.sol#L1296)

node_modules/forge-std/src/StdAssertions.sol#L1268-L1299


 - [ ] ID-77
Reentrancy in [stdStorageSafe.root(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L281-L300):
	External calls:
	- [vm.startMappingRecording()](node_modules/forge-std/src/StdStorage.sol#L284)
	- [child = find(self,true).slot - field_depth](node_modules/forge-std/src/StdStorage.sol#L285)
		- [vm.store(self._target,slot,testVal)](node_modules/forge-std/src/StdStorage.sol#L61)
		- [vm.store(self._target,slot,bytes32(valueToPut))](node_modules/forge-std/src/StdStorage.sol#L74)
		- [vm.store(self._target,slot,prevSlotValue)](node_modules/forge-std/src/StdStorage.sol#L93)
		- [vm.store(self._target,slot,prevSlotValue)](node_modules/forge-std/src/StdStorage.sol#L65)
		- [vm.record()](node_modules/forge-std/src/StdStorage.sol#L121)
	Event emitted after the call(s):
	- [SlotFound(who,fsig,keccak256(bytes)(abi.encodePacked(params,field_depth)),uint256(reads[i]))](node_modules/forge-std/src/StdStorage.sol#L156)
		- [child = find(self,true).slot - field_depth](node_modules/forge-std/src/StdStorage.sol#L285)
	- [WARNING_UninitedSlot(who,uint256(reads[i]))](node_modules/forge-std/src/StdStorage.sol#L132)
		- [child = find(self,true).slot - field_depth](node_modules/forge-std/src/StdStorage.sol#L285)

node_modules/forge-std/src/StdStorage.sol#L281-L300


## assembly
Impact: Informational
Confidence: High
 - [ ] ID-78
[safeconsole.log(address,address,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L2866-L2893) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2872-L2884)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2886-L2892)

node_modules/forge-std/src/safeconsole.sol#L2866-L2893


 - [ ] ID-79
[safeconsole.log(bool,address,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L5606-L5647) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5614-L5636)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5638-L5646)

node_modules/forge-std/src/safeconsole.sol#L5606-L5647


 - [ ] ID-80
[SafeCast.toUint(bool)](node_modules/@openzeppelin/contracts/utils/math/SafeCast.sol#L1157-L1161) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/SafeCast.sol#L1158-L1160)

node_modules/@openzeppelin/contracts/utils/math/SafeCast.sol#L1157-L1161


 - [ ] ID-81
[safeconsole.log(bytes32,bytes32,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L12650-L12698) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12660-L12685)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12687-L12697)

node_modules/forge-std/src/safeconsole.sol#L12650-L12698


 - [ ] ID-82
[safeconsole.log(address,uint256,address,bool)](node_modules/forge-std/src/safeconsole.sol#L3975-L4002) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3981-L3993)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3995-L4001)

node_modules/forge-std/src/safeconsole.sol#L3975-L4002


 - [ ] ID-83
[safeconsole.log.asm_0.writeString()](node_modules/forge-std/src/safeconsole.sol#L13200-L13206) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13200-L13206)

node_modules/forge-std/src/safeconsole.sol#L13200-L13206


 - [ ] ID-84
[safeconsole.log(uint256,uint256,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L9195-L9236) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9203-L9225)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9227-L9235)

node_modules/forge-std/src/safeconsole.sol#L9195-L9236


 - [ ] ID-85
[StdChains._getChainWithUpdatedRpcUrl(string,StdChains.Chain)](node_modules/forge-std/src/StdChains.sol#L154-L188) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdChains.sol#L181-L183)

node_modules/forge-std/src/StdChains.sol#L154-L188


 - [ ] ID-86
[StorageSlot.getAddressSlot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L66-L70) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L67-L69)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L66-L70


 - [ ] ID-87
[safeconsole.log(address,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L866-L889) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L871-L881)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L883-L888)

node_modules/forge-std/src/safeconsole.sol#L866-L889


 - [ ] ID-88
[safeconsole._memcopyView(uint256,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L35-L39) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L36-L38)

node_modules/forge-std/src/safeconsole.sol#L35-L39


 - [ ] ID-89
[safeconsole.log(bool,address,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L5519-L5546) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5525-L5537)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5539-L5545)

node_modules/forge-std/src/safeconsole.sol#L5519-L5546


 - [ ] ID-90
[safeconsole.log(uint256,address,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L7768-L7795) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7774-L7786)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7788-L7794)

node_modules/forge-std/src/safeconsole.sol#L7768-L7795


 - [ ] ID-91
[safeconsole.log(bytes32,address,address)](node_modules/forge-std/src/safeconsole.sol#L2128-L2165) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2135-L2155)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2157-L2164)

node_modules/forge-std/src/safeconsole.sol#L2128-L2165


 - [ ] ID-92
[safeconsole.log(bool,bytes32,address,address)](node_modules/forge-std/src/safeconsole.sol#L6966-L7007) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6974-L6996)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6998-L7006)

node_modules/forge-std/src/safeconsole.sol#L6966-L7007


 - [ ] ID-93
[safeconsole.log(bytes32,bool,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L11127-L11168) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11135-L11157)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11159-L11167)

node_modules/forge-std/src/safeconsole.sol#L11127-L11168


 - [ ] ID-94
[safeconsole.log(bool,uint256,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L6715-L6742) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6721-L6733)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6735-L6741)

node_modules/forge-std/src/safeconsole.sol#L6715-L6742


 - [ ] ID-95
[safeconsole.log(bool,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L1193-L1230) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1200-L1220)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1222-L1229)

node_modules/forge-std/src/safeconsole.sol#L1193-L1230


 - [ ] ID-96
[safeconsole.log(bool,uint256,address,bool)](node_modules/forge-std/src/safeconsole.sol#L6426-L6453) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6432-L6444)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6446-L6452)

node_modules/forge-std/src/safeconsole.sol#L6426-L6453


 - [ ] ID-97
[safeconsole.log(bool,bool,address,address)](node_modules/forge-std/src/safeconsole.sol#L5828-L5855) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5834-L5846)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5848-L5854)

node_modules/forge-std/src/safeconsole.sol#L5828-L5855


 - [ ] ID-98
[LowLevelCall.callReturn64Bytes(address,uint256,bytes)](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L38-L48) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L43-L47)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L38-L48


 - [ ] ID-99
[safeconsole.log(address,address,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L3068-L3095) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3074-L3086)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3088-L3094)

node_modules/forge-std/src/safeconsole.sol#L3068-L3095


 - [ ] ID-100
[Memory.length(Memory.Slice)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L65-L69) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L66-L68)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L65-L69


 - [ ] ID-101
[safeconsole.log(uint256,bool,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L8712-L8753) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8720-L8742)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8744-L8752)

node_modules/forge-std/src/safeconsole.sol#L8712-L8753


 - [ ] ID-102
[safeconsole.log(bool,bool,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L6016-L6043) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6022-L6034)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6036-L6042)

node_modules/forge-std/src/safeconsole.sol#L6016-L6043


 - [ ] ID-103
[safeconsole.log(uint256,address,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L8057-L8098) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8065-L8087)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8089-L8097)

node_modules/forge-std/src/safeconsole.sol#L8057-L8098


 - [ ] ID-104
[safeconsole.log(uint256,bool,bool,address)](node_modules/forge-std/src/safeconsole.sol#L8409-L8436) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8415-L8427)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8429-L8435)

node_modules/forge-std/src/safeconsole.sol#L8409-L8436


 - [ ] ID-105
[safeconsole.log(address,bool,address)](node_modules/forge-std/src/safeconsole.sol#L727-L750) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L732-L742)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L744-L749)

node_modules/forge-std/src/safeconsole.sol#L727-L750


 - [ ] ID-106
[safeconsole.log(bool,bool,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L6218-L6259) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6226-L6248)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6250-L6258)

node_modules/forge-std/src/safeconsole.sol#L6218-L6259


 - [ ] ID-107
[safeconsole.log(uint256,bytes32,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L10104-L10159) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10116-L10144)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10146-L10158)

node_modules/forge-std/src/safeconsole.sol#L10104-L10159


 - [ ] ID-108
[safeconsole.log(bool,uint256,bool,address)](node_modules/forge-std/src/safeconsole.sol#L6527-L6554) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6533-L6545)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6547-L6553)

node_modules/forge-std/src/safeconsole.sol#L6527-L6554


 - [ ] ID-109
[safeconsole.log(uint256,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L1876-L1899) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1881-L1891)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1893-L1898)

node_modules/forge-std/src/safeconsole.sol#L1876-L1899


 - [ ] ID-110
[safeconsole.log(address,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L955-L992) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L962-L982)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L984-L991)

node_modules/forge-std/src/safeconsole.sol#L955-L992


 - [ ] ID-111
[Memory.isReserved(Memory.Slice)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L121-L127) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L124-L126)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L121-L127


 - [ ] ID-112
[safeconsole.log(address,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L994-L1031) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1001-L1021)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1023-L1030)

node_modules/forge-std/src/safeconsole.sol#L994-L1031


 - [ ] ID-113
[safeconsole.log(uint256,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L1812-L1849) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1819-L1839)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1841-L1848)

node_modules/forge-std/src/safeconsole.sol#L1812-L1849


 - [ ] ID-114
[StdCheatsSafe._pureChainId()](node_modules/forge-std/src/StdCheats.sol#L657-L664) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdCheats.sol#L660-L662)

node_modules/forge-std/src/StdCheats.sol#L657-L664


 - [ ] ID-115
[safeconsole.log(address,address,address,bool)](node_modules/forge-std/src/safeconsole.sol#L2837-L2864) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2843-L2855)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2857-L2863)

node_modules/forge-std/src/safeconsole.sol#L2837-L2864


 - [ ] ID-116
[safeconsole.log(uint256,bool,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L8755-L8796) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8763-L8785)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8787-L8795)

node_modules/forge-std/src/safeconsole.sol#L8755-L8796


 - [ ] ID-117
[safeconsole.log(uint256,bool,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L8366-L8407) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8374-L8396)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8398-L8406)

node_modules/forge-std/src/safeconsole.sol#L8366-L8407


 - [ ] ID-118
[LowLevelCall.staticcallNoReturn(address,bytes)](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L51-L55) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L52-L54)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L51-L55


 - [ ] ID-119
[safeconsole.log(address,bool,address,address)](node_modules/forge-std/src/safeconsole.sol#L3377-L3404) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3383-L3395)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3397-L3403)

node_modules/forge-std/src/safeconsole.sol#L3377-L3404


 - [ ] ID-120
[SafeERC20._safeTransfer(IERC20,address,uint256,bool)](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L176-L200) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L179-L199)

node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L176-L200


 - [ ] ID-121
[safeconsole.log(bytes32,bytes32,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L12957-L13012) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12969-L12997)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12999-L13011)

node_modules/forge-std/src/safeconsole.sol#L12957-L13012


 - [ ] ID-122
[safeconsole.log(address,uint256,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L4264-L4291) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4270-L4282)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4284-L4290)

node_modules/forge-std/src/safeconsole.sol#L4264-L4291


 - [ ] ID-123
[safeconsole.log(bool,address,address,bool)](node_modules/forge-std/src/safeconsole.sol#L5288-L5315) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5294-L5306)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5308-L5314)

node_modules/forge-std/src/safeconsole.sol#L5288-L5315


 - [ ] ID-124
[safeconsole.log(bytes32,bytes32,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L12700-L12748) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12710-L12735)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12737-L12747)

node_modules/forge-std/src/safeconsole.sol#L12700-L12748


 - [ ] ID-125
[ERC4626Upgradeable._getERC4626Storage()](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L85-L89) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L86-L88)

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L85-L89


 - [ ] ID-126
[safeconsole.log(uint256,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L1901-L1924) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1906-L1916)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1918-L1923)

node_modules/forge-std/src/safeconsole.sol#L1901-L1924


 - [ ] ID-127
[safeconsole.log(address,uint256,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L4336-L4377) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4344-L4366)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4368-L4376)

node_modules/forge-std/src/safeconsole.sol#L4336-L4377


 - [ ] ID-128
[safeconsole.log(bool,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L1282-L1305) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1287-L1297)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1299-L1304)

node_modules/forge-std/src/safeconsole.sol#L1282-L1305


 - [ ] ID-129
[LowLevelCall.delegatecallReturn64Bytes(address,bytes)](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L85-L94) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L89-L93)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L85-L94


 - [ ] ID-130
[safeconsole.log(bool,bool,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L6088-L6115) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6094-L6106)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6108-L6114)

node_modules/forge-std/src/safeconsole.sol#L6088-L6115


 - [ ] ID-131
[safeconsole.log(bytes32,bytes32,bool,address)](node_modules/forge-std/src/safeconsole.sol#L12600-L12648) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12610-L12635)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12637-L12647)

node_modules/forge-std/src/safeconsole.sol#L12600-L12648


 - [ ] ID-132
[safeconsole.log(bool,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L1371-L1394) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1376-L1386)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1388-L1393)

node_modules/forge-std/src/safeconsole.sol#L1371-L1394


 - [ ] ID-133
[Math.tryModExp(bytes,bytes,bytes)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L451-L473) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L463-L472)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L451-L473


 - [ ] ID-134
[safeconsole.log(bool,address,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L5692-L5733) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5700-L5722)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5724-L5732)

node_modules/forge-std/src/safeconsole.sol#L5692-L5733


 - [ ] ID-135
[safeconsole.log(bytes32,address,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L10290-L10338) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10300-L10325)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10327-L10337)

node_modules/forge-std/src/safeconsole.sol#L10290-L10338


 - [ ] ID-136
[safeconsole.log(uint256,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L2082-L2126) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2091-L2114)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2116-L2125)

node_modules/forge-std/src/safeconsole.sol#L2082-L2126


 - [ ] ID-137
[safeconsole.log(address,bytes32,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L5052-L5100) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5062-L5087)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5089-L5099)

node_modules/forge-std/src/safeconsole.sol#L5052-L5100


 - [ ] ID-138
[safeconsole.log(bool,bytes32,bool,address)](node_modules/forge-std/src/safeconsole.sol#L7145-L7186) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7153-L7175)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7177-L7185)

node_modules/forge-std/src/safeconsole.sol#L7145-L7186


 - [ ] ID-139
[safeconsole.log(bool,bytes32,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L7603-L7651) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7613-L7638)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7640-L7650)

node_modules/forge-std/src/safeconsole.sol#L7603-L7651


 - [ ] ID-140
[safeconsole.log(bool,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L1421-L1458) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1428-L1448)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1450-L1457)

node_modules/forge-std/src/safeconsole.sol#L1421-L1458


 - [ ] ID-141
[safeconsole.log(bytes32,bytes32,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L13128-L13183) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13140-L13168)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13170-L13182)

node_modules/forge-std/src/safeconsole.sol#L13128-L13183


 - [ ] ID-142
[safeconsole.log(bytes32,bool,address,bool)](node_modules/forge-std/src/safeconsole.sol#L10948-L10989) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10956-L10978)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10980-L10988)

node_modules/forge-std/src/safeconsole.sol#L10948-L10989


 - [ ] ID-143
[safeconsole.log(address,address,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L2895-L2936) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2903-L2925)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2927-L2935)

node_modules/forge-std/src/safeconsole.sol#L2895-L2936


 - [ ] ID-144
[safeconsole.log(bool,bool,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L6175-L6216) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6183-L6205)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6207-L6215)

node_modules/forge-std/src/safeconsole.sol#L6175-L6216


 - [ ] ID-145
[StorageSlot.getUint256Slot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L93-L97) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L94-L96)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L93-L97


 - [ ] ID-146
[safeconsole.log(bytes32)](node_modules/forge-std/src/safeconsole.sol#L141-L170) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L146-L162)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L164-L169)

node_modules/forge-std/src/safeconsole.sol#L141-L170


 - [ ] ID-147
[safeconsole.log(bytes32,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L2454-L2491) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2461-L2481)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2483-L2490)

node_modules/forge-std/src/safeconsole.sol#L2454-L2491


 - [ ] ID-148
[safeconsole.log(bool,uint256,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L6744-L6785) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6752-L6774)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6776-L6784)

node_modules/forge-std/src/safeconsole.sol#L6744-L6785


 - [ ] ID-149
[safeconsole.log(bytes32,bytes32,address,address)](node_modules/forge-std/src/safeconsole.sol#L12393-L12441) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12403-L12428)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12430-L12440)

node_modules/forge-std/src/safeconsole.sol#L12393-L12441


 - [ ] ID-150
[StdCheatsSafe.deployCode(string,bytes)](node_modules/forge-std/src/StdCheats.sol#L517-L524) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdCheats.sol#L519-L521)

node_modules/forge-std/src/StdCheats.sol#L517-L524


 - [ ] ID-151
[safeconsole.log(address,bytes32,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L5002-L5050) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5012-L5037)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5039-L5049)

node_modules/forge-std/src/safeconsole.sol#L5002-L5050


 - [ ] ID-152
[Memory.asSlice(bytes)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L58-L62) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L59-L61)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L58-L62


 - [ ] ID-153
[safeconsole.log(uint256,address)](node_modules/forge-std/src/safeconsole.sol#L368-L387) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L372-L380)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L382-L386)

node_modules/forge-std/src/safeconsole.sol#L368-L387


 - [ ] ID-154
[safeconsole.log(address,bool,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L3810-L3851) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3818-L3840)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3842-L3850)

node_modules/forge-std/src/safeconsole.sol#L3810-L3851


 - [ ] ID-155
[safeconsole.log(bytes32,bytes32,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L12807-L12855) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12817-L12842)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12844-L12854)

node_modules/forge-std/src/safeconsole.sol#L12807-L12855


 - [ ] ID-156
[safeconsole.log(uint256,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L1965-L2002) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1972-L1992)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1994-L2001)

node_modules/forge-std/src/safeconsole.sol#L1965-L2002


 - [ ] ID-157
[safeconsole.log(address,bool,bool,address)](node_modules/forge-std/src/safeconsole.sol#L3507-L3534) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3513-L3525)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3527-L3533)

node_modules/forge-std/src/safeconsole.sol#L3507-L3534


 - [ ] ID-158
[safeconsole.log(bool,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L1396-L1419) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1401-L1411)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1413-L1418)

node_modules/forge-std/src/safeconsole.sol#L1396-L1419


 - [ ] ID-159
[safeconsole.log(bool,bool,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L6117-L6144) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6123-L6135)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6137-L6143)

node_modules/forge-std/src/safeconsole.sol#L6117-L6144


 - [ ] ID-160
[safeconsole.log(bytes32,bool,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L11492-L11540) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11502-L11527)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11529-L11539)

node_modules/forge-std/src/safeconsole.sol#L11492-L11540


 - [ ] ID-161
[StdUtils._sendLogPayloadView(bytes)](node_modules/forge-std/src/StdUtils.sol#L227-L234) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdUtils.sol#L230-L233)

node_modules/forge-std/src/StdUtils.sol#L227-L234


 - [ ] ID-162
[safeconsole.log(address,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L688-L725) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L695-L715)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L717-L724)

node_modules/forge-std/src/safeconsole.sol#L688-L725


 - [ ] ID-163
[safeconsole.log(bool,bool,address,bool)](node_modules/forge-std/src/safeconsole.sol#L5857-L5884) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5863-L5875)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5877-L5883)

node_modules/forge-std/src/safeconsole.sol#L5857-L5884


 - [ ] ID-164
[safeconsole.log(uint256,bool,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L8337-L8364) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8343-L8355)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8357-L8363)

node_modules/forge-std/src/safeconsole.sol#L8337-L8364


 - [ ] ID-165
[safeconsole.log(bytes32,bool,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L11263-L11304) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11271-L11293)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11295-L11303)

node_modules/forge-std/src/safeconsole.sol#L11263-L11304


 - [ ] ID-166
[safeconsole.log(address,address,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L3097-L3124) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3103-L3115)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3117-L3123)

node_modules/forge-std/src/safeconsole.sol#L3097-L3124


 - [ ] ID-167
[safeconsole.log(uint256,uint256,bool,address)](node_modules/forge-std/src/safeconsole.sol#L8978-L9005) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8984-L8996)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8998-L9004)

node_modules/forge-std/src/safeconsole.sol#L8978-L9005


 - [ ] ID-168
[safeconsole.log(address,uint256,address,address)](node_modules/forge-std/src/safeconsole.sol#L3946-L3973) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3952-L3964)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3966-L3972)

node_modules/forge-std/src/safeconsole.sol#L3946-L3973


 - [ ] ID-169
[safeconsole.log(address,uint256,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L4134-L4161) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4140-L4152)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4154-L4160)

node_modules/forge-std/src/safeconsole.sol#L4134-L4161


 - [ ] ID-170
[safeconsole.log(uint256,bytes32,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L9954-L10002) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9964-L9989)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9991-L10001)

node_modules/forge-std/src/safeconsole.sol#L9954-L10002


 - [ ] ID-171
[safeconsole.log(bool,bytes32,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L7503-L7551) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7513-L7538)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7540-L7550)

node_modules/forge-std/src/safeconsole.sol#L7503-L7551


 - [ ] ID-172
[safeconsole.log(address,address,bool,address)](node_modules/forge-std/src/safeconsole.sol#L2938-L2965) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2944-L2956)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2958-L2964)

node_modules/forge-std/src/safeconsole.sol#L2938-L2965


 - [ ] ID-173
[stdStorageSafe.getMaskByOffsets(uint256,uint256)](node_modules/forge-std/src/StdStorage.sol#L340-L346) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdStorage.sol#L343-L345)

node_modules/forge-std/src/StdStorage.sol#L340-L346


 - [ ] ID-174
[safeconsole.log(uint256,uint256,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L9166-L9193) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9172-L9184)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9186-L9192)

node_modules/forge-std/src/safeconsole.sol#L9166-L9193


 - [ ] ID-175
[safeconsole.log(uint256,address,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L7927-L7968) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7935-L7957)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7959-L7967)

node_modules/forge-std/src/safeconsole.sol#L7927-L7968


 - [ ] ID-176
[stdStorage.checked_write(StdStorage,bool)](node_modules/forge-std/src/StdStorage.sol#L442-L448) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdStorage.sol#L444-L446)

node_modules/forge-std/src/StdStorage.sol#L442-L448


 - [ ] ID-177
[safeconsole.log(bytes32,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L2408-L2452) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2417-L2440)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2442-L2451)

node_modules/forge-std/src/safeconsole.sol#L2408-L2452


 - [ ] ID-178
[safeconsole.log(address,address,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L3126-L3153) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3132-L3144)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3146-L3152)

node_modules/forge-std/src/safeconsole.sol#L3126-L3153


 - [ ] ID-179
[safeconsole.log(bool,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L1538-L1575) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1545-L1565)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1567-L1574)

node_modules/forge-std/src/safeconsole.sol#L1538-L1575


 - [ ] ID-180
[safeconsole.log(bool,bool,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L6304-L6345) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6312-L6334)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6336-L6344)

node_modules/forge-std/src/safeconsole.sol#L6304-L6345


 - [ ] ID-181
[safeconsole.log(bytes32,bytes32,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L13014-L13069) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13026-L13054)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13056-L13068)

node_modules/forge-std/src/safeconsole.sol#L13014-L13069


 - [ ] ID-182
[safeconsole.log(address,bytes32,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L4644-L4692) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4654-L4679)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4681-L4691)

node_modules/forge-std/src/safeconsole.sol#L4644-L4692


 - [ ] ID-183
[safeconsole.log(bool,uint256,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L6830-L6871) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6838-L6860)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6862-L6870)

node_modules/forge-std/src/safeconsole.sol#L6830-L6871


 - [ ] ID-184
[safeconsole.log(bytes32,uint256,bool,address)](node_modules/forge-std/src/safeconsole.sol#L11828-L11869) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11836-L11858)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11860-L11868)

node_modules/forge-std/src/safeconsole.sol#L11828-L11869


 - [ ] ID-185
[safeconsole.log(uint256,bytes32,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L9682-L9723) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9690-L9712)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9714-L9722)

node_modules/forge-std/src/safeconsole.sol#L9682-L9723


 - [ ] ID-186
[safeconsole.log(uint256,address,address)](node_modules/forge-std/src/safeconsole.sol#L1623-L1646) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1628-L1638)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1640-L1645)

node_modules/forge-std/src/safeconsole.sol#L1623-L1646


 - [ ] ID-187
[safeconsole.log(address,bool,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L3853-L3894) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3861-L3883)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3885-L3893)

node_modules/forge-std/src/safeconsole.sol#L3853-L3894


 - [ ] ID-188
[safeconsole.log(bool,address,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L5447-L5474) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5453-L5465)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5467-L5473)

node_modules/forge-std/src/safeconsole.sol#L5447-L5474


 - [ ] ID-189
[safeconsole.log(address,address,bool)](node_modules/forge-std/src/safeconsole.sol#L638-L661) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L643-L653)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L655-L660)

node_modules/forge-std/src/safeconsole.sol#L638-L661


 - [ ] ID-190
[safeconsole.log(bytes32,uint256,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L12336-L12391) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12348-L12376)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12378-L12390)

node_modules/forge-std/src/safeconsole.sol#L12336-L12391


 - [ ] ID-191
[safeconsole.log(address,address,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L3198-L3239) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3206-L3228)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3230-L3238)

node_modules/forge-std/src/safeconsole.sol#L3198-L3239


 - [ ] ID-192
[safeconsole.log(bool,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L1346-L1369) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1351-L1361)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1363-L1368)

node_modules/forge-std/src/safeconsole.sol#L1346-L1369


 - [ ] ID-193
[Math.log2(uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L619-L658) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L655-L657)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L619-L658


 - [ ] ID-194
[safeconsole.log(address,address,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L3025-L3066) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3033-L3055)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3057-L3065)

node_modules/forge-std/src/safeconsole.sol#L3025-L3066


 - [ ] ID-195
[safeconsole.log(uint256,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L1787-L1810) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1792-L1802)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1804-L1809)

node_modules/forge-std/src/safeconsole.sol#L1787-L1810


 - [ ] ID-196
[safeconsole.log(bytes32,address,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L10605-L10646) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10613-L10635)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10637-L10645)

node_modules/forge-std/src/safeconsole.sol#L10605-L10646


 - [ ] ID-197
[safeconsole.log(bool,uint256,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L6585-L6612) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6591-L6603)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6605-L6611)

node_modules/forge-std/src/safeconsole.sol#L6585-L6612


 - [ ] ID-198
[safeconsole.log(bytes32,bytes32,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L12543-L12598) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12555-L12583)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12585-L12597)

node_modules/forge-std/src/safeconsole.sol#L12543-L12598


 - [ ] ID-199
[safeconsole.log(bool,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L1499-L1536) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1506-L1526)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1528-L1535)

node_modules/forge-std/src/safeconsole.sol#L1499-L1536


 - [ ] ID-200
[safeconsole.log(uint256,bytes32,address,bool)](node_modules/forge-std/src/safeconsole.sol#L9460-L9501) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9468-L9490)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9492-L9500)

node_modules/forge-std/src/safeconsole.sol#L9460-L9501


 - [ ] ID-201
[safeconsole.log(address,uint256,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L4379-L4420) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4387-L4409)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4411-L4419)

node_modules/forge-std/src/safeconsole.sol#L4379-L4420


 - [ ] ID-202
[safeconsole.log(uint256,bytes32,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L9818-L9859) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9826-L9848)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9850-L9858)

node_modules/forge-std/src/safeconsole.sol#L9818-L9859


 - [ ] ID-203
[safeconsole.log(uint256,bool,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L8798-L8846) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8808-L8833)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8835-L8845)

node_modules/forge-std/src/safeconsole.sol#L8798-L8846


 - [ ] ID-204
[safeconsole.log(uint256,address,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L8100-L8141) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8108-L8130)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8132-L8140)

node_modules/forge-std/src/safeconsole.sol#L8100-L8141


 - [ ] ID-205
[safeconsole.log(bytes32,bool,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L11592-L11647) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11604-L11632)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11634-L11646)

node_modules/forge-std/src/safeconsole.sol#L11592-L11647


 - [ ] ID-206
[safeconsole.log(bytes32,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L2571-L2615) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2580-L2603)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2605-L2614)

node_modules/forge-std/src/safeconsole.sol#L2571-L2615


 - [ ] ID-207
[safeconsole.log(bytes32,bool,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L11542-L11590) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11552-L11577)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11579-L11589)

node_modules/forge-std/src/safeconsole.sol#L11542-L11590


 - [ ] ID-208
[safeconsole._sendLogPayload(uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L11-L18) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L14-L16)

node_modules/forge-std/src/safeconsole.sol#L11-L18


 - [ ] ID-209
[safeconsole.log(address,address,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L3241-L3282) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3249-L3271)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3273-L3281)

node_modules/forge-std/src/safeconsole.sol#L3241-L3282


 - [ ] ID-210
[safeconsole.log(uint256,address,address,address)](node_modules/forge-std/src/safeconsole.sol#L7710-L7737) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7716-L7728)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7730-L7736)

node_modules/forge-std/src/safeconsole.sol#L7710-L7737


 - [ ] ID-211
[safeconsole.log(bool,bytes32,address,bool)](node_modules/forge-std/src/safeconsole.sol#L7009-L7050) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7017-L7039)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7041-L7049)

node_modules/forge-std/src/safeconsole.sol#L7009-L7050


 - [ ] ID-212
[LowLevelCall.staticcallReturn64Bytes(address,bytes)](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L62-L71) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L66-L70)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L62-L71


 - [ ] ID-213
[safeconsole.log(bool,bool,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L5886-L5913) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5892-L5904)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5906-L5912)

node_modules/forge-std/src/safeconsole.sol#L5886-L5913


 - [ ] ID-214
[safeconsole.log(bytes32,address,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L10562-L10603) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10570-L10592)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10594-L10602)

node_modules/forge-std/src/safeconsole.sol#L10562-L10603


 - [ ] ID-215
[safeconsole.log(address,bytes32,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L5202-L5257) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5214-L5242)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5244-L5256)

node_modules/forge-std/src/safeconsole.sol#L5202-L5257


 - [ ] ID-216
[safeconsole.log(bytes32,uint256,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L12236-L12284) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12246-L12271)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12273-L12283)

node_modules/forge-std/src/safeconsole.sol#L12236-L12284


 - [ ] ID-217
[safeconsole.log(uint256,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L1762-L1785) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1767-L1777)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1779-L1784)

node_modules/forge-std/src/safeconsole.sol#L1762-L1785


 - [ ] ID-218
[safeconsole.log(address,bool,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L3464-L3505) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3472-L3494)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3496-L3504)

node_modules/forge-std/src/safeconsole.sol#L3464-L3505


 - [ ] ID-219
[safeconsole.log(uint256,bool,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L8568-L8595) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8574-L8586)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8588-L8594)

node_modules/forge-std/src/safeconsole.sol#L8568-L8595


 - [ ] ID-220
[StorageSlot.getBooleanSlot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L75-L79) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L76-L78)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L75-L79


 - [ ] ID-221
[safeconsole.log(bool,uint256,address,address)](node_modules/forge-std/src/safeconsole.sol#L6397-L6424) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6403-L6415)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6417-L6423)

node_modules/forge-std/src/safeconsole.sol#L6397-L6424


 - [ ] ID-222
[safeconsole.log(bool,bytes32,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L7188-L7229) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7196-L7218)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7220-L7228)

node_modules/forge-std/src/safeconsole.sol#L7188-L7229


 - [ ] ID-223
[safeconsole.log(bool)](node_modules/forge-std/src/safeconsole.sol#L107-L122) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L110-L116)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L118-L121)

node_modules/forge-std/src/safeconsole.sol#L107-L122


 - [ ] ID-224
[safeconsole.log(address,uint256,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L4163-L4204) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4171-L4193)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4195-L4203)

node_modules/forge-std/src/safeconsole.sol#L4163-L4204


 - [ ] ID-225
[safeconsole.log(address,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L1072-L1116) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1081-L1104)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1106-L1115)

node_modules/forge-std/src/safeconsole.sol#L1072-L1116


 - [ ] ID-226
[safeconsole.log(uint256,uint256,address,address)](node_modules/forge-std/src/safeconsole.sol#L8848-L8875) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8854-L8866)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8868-L8874)

node_modules/forge-std/src/safeconsole.sol#L8848-L8875


 - [ ] ID-227
[safeconsole.log(bool,address,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L5778-L5826) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5788-L5813)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5815-L5825)

node_modules/forge-std/src/safeconsole.sol#L5778-L5826


 - [ ] ID-228
[safeconsole.log(bool,bytes32,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L7052-L7093) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7060-L7082)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7084-L7092)

node_modules/forge-std/src/safeconsole.sol#L7052-L7093


 - [ ] ID-229
[safeconsole.log(bool,address,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L5577-L5604) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5583-L5595)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5597-L5603)

node_modules/forge-std/src/safeconsole.sol#L5577-L5604


 - [ ] ID-230
[safeconsole.log(uint256,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L1673-L1696) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1678-L1688)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1690-L1695)

node_modules/forge-std/src/safeconsole.sol#L1673-L1696


 - [ ] ID-231
[safeconsole.log(bytes32,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L2617-L2661) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2626-L2649)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2651-L2660)

node_modules/forge-std/src/safeconsole.sol#L2617-L2661


 - [ ] ID-232
[safeconsole.log(uint256,address,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L7898-L7925) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7904-L7916)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7918-L7924)

node_modules/forge-std/src/safeconsole.sol#L7898-L7925


 - [ ] ID-233
[safeconsole.log(address,bool,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L3637-L3664) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3643-L3655)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3657-L3663)

node_modules/forge-std/src/safeconsole.sol#L3637-L3664


 - [ ] ID-234
[safeconsole.log(address,address,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L3284-L3325) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3292-L3314)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3316-L3324)

node_modules/forge-std/src/safeconsole.sol#L3284-L3325


 - [ ] ID-235
[safeconsole.log(address,bool)](node_modules/forge-std/src/safeconsole.sol#L193-L212) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L197-L205)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L207-L211)

node_modules/forge-std/src/safeconsole.sol#L193-L212


 - [ ] ID-236
[safeconsole.log(bool,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L1577-L1621) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1586-L1609)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1611-L1620)

node_modules/forge-std/src/safeconsole.sol#L1577-L1621


 - [ ] ID-237
[safeconsole.log(bytes32,bytes32,address,bool)](node_modules/forge-std/src/safeconsole.sol#L12443-L12491) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12453-L12478)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12480-L12490)

node_modules/forge-std/src/safeconsole.sol#L12443-L12491


 - [ ] ID-238
[safeconsole.log(address,bool,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L3695-L3722) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3701-L3713)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3715-L3721)

node_modules/forge-std/src/safeconsole.sol#L3695-L3722


 - [ ] ID-239
[safeconsole.log(bytes32,bool,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L11349-L11390) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11357-L11379)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11381-L11389)

node_modules/forge-std/src/safeconsole.sol#L11349-L11390


 - [ ] ID-240
[safeconsole.log(uint256,address,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L7999-L8026) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8005-L8017)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8019-L8025)

node_modules/forge-std/src/safeconsole.sol#L7999-L8026


 - [ ] ID-241
[safeconsole.log(address,uint256)](node_modules/forge-std/src/safeconsole.sol#L214-L233) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L218-L226)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L228-L232)

node_modules/forge-std/src/safeconsole.sol#L214-L233


 - [ ] ID-242
[safeconsole.log(bool,bytes32,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L7324-L7365) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7332-L7354)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7356-L7364)

node_modules/forge-std/src/safeconsole.sol#L7324-L7365


 - [ ] ID-243
[safeconsole.log(bool,uint256,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L6686-L6713) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6692-L6704)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6706-L6712)

node_modules/forge-std/src/safeconsole.sol#L6686-L6713


 - [ ] ID-244
[safeconsole.log(uint256,bytes32,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L9775-L9816) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9783-L9805)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9807-L9815)

node_modules/forge-std/src/safeconsole.sol#L9775-L9816


 - [ ] ID-245
[safeconsole.log(uint256,bool,address,bool)](node_modules/forge-std/src/safeconsole.sol#L8308-L8335) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8314-L8326)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8328-L8334)

node_modules/forge-std/src/safeconsole.sol#L8308-L8335


 - [ ] ID-246
[safeconsole.log(address,bytes32,bool,address)](node_modules/forge-std/src/safeconsole.sol#L4694-L4735) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4702-L4724)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4726-L4734)

node_modules/forge-std/src/safeconsole.sol#L4694-L4735


 - [ ] ID-247
[safeconsole.log(address,bytes32,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L5152-L5200) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5162-L5187)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5189-L5199)

node_modules/forge-std/src/safeconsole.sol#L5152-L5200


 - [ ] ID-248
[StorageSlot.getBytes32Slot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L84-L88) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L85-L87)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L84-L88


 - [ ] ID-249
[safeconsole.log(uint256,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L1926-L1963) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1933-L1953)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1955-L1962)

node_modules/forge-std/src/safeconsole.sol#L1926-L1963


 - [ ] ID-250
[safeconsole.log(bool,uint256,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L6614-L6655) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6622-L6644)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6646-L6654)

node_modules/forge-std/src/safeconsole.sol#L6614-L6655


 - [ ] ID-251
[safeconsole.log(bool,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L1460-L1497) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1467-L1487)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1489-L1496)

node_modules/forge-std/src/safeconsole.sol#L1460-L1497


 - [ ] ID-252
[safeconsole.log(bool,address,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L5735-L5776) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5743-L5765)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5767-L5775)

node_modules/forge-std/src/safeconsole.sol#L5735-L5776


 - [ ] ID-253
[safeconsole.log(bool,address,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L5476-L5517) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5484-L5506)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5508-L5516)

node_modules/forge-std/src/safeconsole.sol#L5476-L5517


 - [ ] ID-254
[safeconsole.log(bool,address,address,address)](node_modules/forge-std/src/safeconsole.sol#L5259-L5286) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5265-L5277)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5279-L5285)

node_modules/forge-std/src/safeconsole.sol#L5259-L5286


 - [ ] ID-255
[safeconsole.log(uint256,uint256,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L9281-L9322) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9289-L9311)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9313-L9321)

node_modules/forge-std/src/safeconsole.sol#L9281-L9322


 - [ ] ID-256
[safeconsole.log(uint256,bool,address,address)](node_modules/forge-std/src/safeconsole.sol#L8279-L8306) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8285-L8297)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8299-L8305)

node_modules/forge-std/src/safeconsole.sol#L8279-L8306


 - [ ] ID-257
[safeconsole.log(address,address,address)](node_modules/forge-std/src/safeconsole.sol#L613-L636) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L618-L628)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L630-L635)

node_modules/forge-std/src/safeconsole.sol#L613-L636


 - [ ] ID-258
[Memory.equal(Memory.Slice,Memory.Slice)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L110-L118) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L115-L117)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L110-L118


 - [ ] ID-259
[safeconsole.log(bytes32,uint256,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L12007-L12048) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12015-L12037)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12039-L12047)

node_modules/forge-std/src/safeconsole.sol#L12007-L12048


 - [ ] ID-260
[safeconsole.log(uint256,uint256,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L9036-L9063) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9042-L9054)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9056-L9062)

node_modules/forge-std/src/safeconsole.sol#L9036-L9063


 - [ ] ID-261
[safeconsole.log(uint256,uint256,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L9108-L9135) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9114-L9126)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9128-L9134)

node_modules/forge-std/src/safeconsole.sol#L9108-L9135


 - [ ] ID-262
[safeconsole.log(bool,address,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L5346-L5387) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5354-L5376)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5378-L5386)

node_modules/forge-std/src/safeconsole.sol#L5346-L5387


 - [ ] ID-263
[SafeERC20._safeApprove(IERC20,address,uint256,bool)](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L255-L279) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L258-L278)

node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L255-L279


 - [ ] ID-264
[safeconsole.log(address)](node_modules/forge-std/src/safeconsole.sol#L90-L105) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L93-L99)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L101-L104)

node_modules/forge-std/src/safeconsole.sol#L90-L105


 - [ ] ID-265
[safeconsole.log(address,bytes32,address,bool)](node_modules/forge-std/src/safeconsole.sol#L4558-L4599) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4566-L4588)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4590-L4598)

node_modules/forge-std/src/safeconsole.sol#L4558-L4599


 - [ ] ID-266
[Panic.panic(uint256)](node_modules/@openzeppelin/contracts/utils/Panic.sol#L50-L56) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Panic.sol#L51-L55)

node_modules/@openzeppelin/contracts/utils/Panic.sol#L50-L56


 - [ ] ID-267
[safeconsole.log(address,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L841-L864) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L846-L856)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L858-L863)

node_modules/forge-std/src/safeconsole.sol#L841-L864


 - [ ] ID-268
[LowLevelCall.bubbleRevert()](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L114-L120) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L115-L119)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L114-L120


 - [ ] ID-269
[safeconsole.log(address,bool,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L3724-L3765) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3732-L3754)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3756-L3764)

node_modules/forge-std/src/safeconsole.sol#L3724-L3765


 - [ ] ID-270
[safeconsole.log(bytes32,address,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L10519-L10560) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10527-L10549)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10551-L10559)

node_modules/forge-std/src/safeconsole.sol#L10519-L10560


 - [ ] ID-271
[safeconsole.log(address,bytes32,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L4601-L4642) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4609-L4631)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4633-L4641)

node_modules/forge-std/src/safeconsole.sol#L4601-L4642


 - [ ] ID-272
[safeconsole.log(bytes32,address,bool)](node_modules/forge-std/src/safeconsole.sol#L2167-L2204) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2174-L2194)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2196-L2203)

node_modules/forge-std/src/safeconsole.sol#L2167-L2204


 - [ ] ID-273
[safeconsole.log(bool,bool,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L6045-L6086) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6053-L6075)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6077-L6085)

node_modules/forge-std/src/safeconsole.sol#L6045-L6086


 - [ ] ID-274
[safeconsole.log(address,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L752-L775) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L757-L767)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L769-L774)

node_modules/forge-std/src/safeconsole.sol#L752-L775


 - [ ] ID-275
[safeconsole.log(bool,bytes32,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L7367-L7408) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7375-L7397)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7399-L7407)

node_modules/forge-std/src/safeconsole.sol#L7367-L7408


 - [ ] ID-276
[safeconsole.log(bytes32,uint256,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L11914-L11955) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11922-L11944)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11946-L11954)

node_modules/forge-std/src/safeconsole.sol#L11914-L11955


 - [ ] ID-277
[safeconsole.log(bytes32,bool,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L11170-L11211) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11178-L11200)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11202-L11210)

node_modules/forge-std/src/safeconsole.sol#L11170-L11211


 - [ ] ID-278
[safeconsole.log(bool,bool,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L6347-L6395) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6357-L6382)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6384-L6394)

node_modules/forge-std/src/safeconsole.sol#L6347-L6395


 - [ ] ID-279
[safeconsole.log(address,address,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L2967-L2994) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2973-L2985)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2987-L2993)

node_modules/forge-std/src/safeconsole.sol#L2967-L2994


 - [ ] ID-280
[safeconsole.log(bool,bytes32,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L7453-L7501) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7463-L7488)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7490-L7500)

node_modules/forge-std/src/safeconsole.sol#L7453-L7501


 - [ ] ID-281
[safeconsole.log(bool,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L1307-L1344) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1314-L1334)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1336-L1343)

node_modules/forge-std/src/safeconsole.sol#L1307-L1344


 - [ ] ID-282
[StorageSlot.getInt256Slot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L102-L106) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L103-L105)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L102-L106


 - [ ] ID-283
[safeconsole.log(bytes32,address,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L10383-L10424) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10391-L10413)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10415-L10423)

node_modules/forge-std/src/safeconsole.sol#L10383-L10424


 - [ ] ID-284
[safeconsole.log(uint256,address,bool)](node_modules/forge-std/src/safeconsole.sol#L1648-L1671) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1653-L1663)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1665-L1670)

node_modules/forge-std/src/safeconsole.sol#L1648-L1671


 - [ ] ID-285
[safeconsole.log(bytes32,bool,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L11306-L11347) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11314-L11336)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11338-L11346)

node_modules/forge-std/src/safeconsole.sol#L11306-L11347


 - [ ] ID-286
[safeconsole.log(bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L501-L534) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L507-L525)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L527-L533)

node_modules/forge-std/src/safeconsole.sol#L501-L534


 - [ ] ID-287
[safeconsole.log(uint256,bytes32,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L10004-L10052) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10014-L10039)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10041-L10051)

node_modules/forge-std/src/safeconsole.sol#L10004-L10052


 - [ ] ID-288
[safeconsole.log(address,bool,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L3666-L3693) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3672-L3684)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3686-L3692)

node_modules/forge-std/src/safeconsole.sol#L3666-L3693


 - [ ] ID-289
[Memory._asSlice(uint256,Memory.Pointer)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L137-L141) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L138-L140)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L137-L141


 - [ ] ID-290
[safeconsole.log(uint256,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L2004-L2041) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2011-L2031)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2033-L2040)

node_modules/forge-std/src/safeconsole.sol#L2004-L2041


 - [ ] ID-291
[safeconsole.log(bool,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L1257-L1280) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1262-L1272)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1274-L1279)

node_modules/forge-std/src/safeconsole.sol#L1257-L1280


 - [ ] ID-292
[safeconsole.log(bool,bytes32,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L7095-L7143) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7105-L7130)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7132-L7142)

node_modules/forge-std/src/safeconsole.sol#L7095-L7143


 - [ ] ID-293
[safeconsole.log(uint256,uint256,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L9324-L9365) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9332-L9354)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9356-L9364)

node_modules/forge-std/src/safeconsole.sol#L9324-L9365


 - [ ] ID-294
[safeconsole.log(bytes32,bool,bool,address)](node_modules/forge-std/src/safeconsole.sol#L11084-L11125) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11092-L11114)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11116-L11124)

node_modules/forge-std/src/safeconsole.sol#L11084-L11125


 - [ ] ID-295
[LowLevelCall.callNoReturn(address,uint256,bytes)](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L19-L23) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L20-L22)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L19-L23


 - [ ] ID-296
[safeconsole.log(bytes32,bool,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L11213-L11261) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11223-L11248)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11250-L11260)

node_modules/forge-std/src/safeconsole.sol#L11213-L11261


 - [ ] ID-297
[safeconsole.log(address,bool,address,bool)](node_modules/forge-std/src/safeconsole.sol#L3406-L3433) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3412-L3424)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3426-L3432)

node_modules/forge-std/src/safeconsole.sol#L3406-L3433


 - [ ] ID-298
[safeconsole.log(bytes32,address,address,address)](node_modules/forge-std/src/safeconsole.sol#L10161-L10202) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10169-L10191)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10193-L10201)

node_modules/forge-std/src/safeconsole.sol#L10161-L10202


 - [ ] ID-299
[safeconsole.log(bool,address,bool)](node_modules/forge-std/src/safeconsole.sol#L1143-L1166) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1148-L1158)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1160-L1165)

node_modules/forge-std/src/safeconsole.sol#L1143-L1166


 - [ ] ID-300
[safeconsole.log(bytes32,address,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L10698-L10746) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10708-L10733)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10735-L10745)

node_modules/forge-std/src/safeconsole.sol#L10698-L10746


 - [ ] ID-301
[safeconsole.log(uint256,uint256,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L8935-L8976) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8943-L8965)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8967-L8975)

node_modules/forge-std/src/safeconsole.sol#L8935-L8976


 - [ ] ID-302
[safeconsole.log(bytes32,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L2709-L2753) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2718-L2741)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2743-L2752)

node_modules/forge-std/src/safeconsole.sol#L2709-L2753


 - [ ] ID-303
[safeconsole.log(address,uint256,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L4465-L4513) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4475-L4500)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4502-L4512)

node_modules/forge-std/src/safeconsole.sol#L4465-L4513


 - [ ] ID-304
[safeconsole.log(uint256,address,address,bool)](node_modules/forge-std/src/safeconsole.sol#L7739-L7766) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7745-L7757)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7759-L7765)

node_modules/forge-std/src/safeconsole.sol#L7739-L7766


 - [ ] ID-305
[safeconsole.log(uint256,bool,address)](node_modules/forge-std/src/safeconsole.sol#L1737-L1760) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1742-L1752)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1754-L1759)

node_modules/forge-std/src/safeconsole.sol#L1737-L1760


 - [ ] ID-306
[safeconsole.log(address,uint256,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L4422-L4463) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4430-L4452)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4454-L4462)

node_modules/forge-std/src/safeconsole.sol#L4422-L4463


 - [ ] ID-307
[Memory.load(Memory.Slice,uint256)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L88-L95) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L92-L94)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L88-L95


 - [ ] ID-308
[safeconsole.log(bool,uint256,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L6556-L6583) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6562-L6574)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6576-L6582)

node_modules/forge-std/src/safeconsole.sol#L6556-L6583


 - [ ] ID-309
[safeconsole.log(address,uint256,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L4004-L4031) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4010-L4022)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4024-L4030)

node_modules/forge-std/src/safeconsole.sol#L4004-L4031


 - [ ] ID-310
[safeconsole.log(bytes32,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L2532-L2569) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2539-L2559)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2561-L2568)

node_modules/forge-std/src/safeconsole.sol#L2532-L2569


 - [ ] ID-311
[safeconsole.log(bool,bytes32,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L7231-L7272) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7239-L7261)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7263-L7271)

node_modules/forge-std/src/safeconsole.sol#L7231-L7272


 - [ ] ID-312
[safeconsole.log(bytes32,address,bool,address)](node_modules/forge-std/src/safeconsole.sol#L10340-L10381) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10348-L10370)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10372-L10380)

node_modules/forge-std/src/safeconsole.sol#L10340-L10381


 - [ ] ID-313
[StdCheatsSafe.assumeUnusedAddress(address)](node_modules/forge-std/src/StdCheats.sol#L358-L368) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdCheats.sol#L360-L362)

node_modules/forge-std/src/StdCheats.sol#L358-L368


 - [ ] ID-314
[safeconsole.log(uint256,uint256,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L9238-L9279) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9246-L9268)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9270-L9278)

node_modules/forge-std/src/safeconsole.sol#L9238-L9279


 - [ ] ID-315
[safeconsole.log(bytes32,uint256,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L12093-L12134) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12101-L12123)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12125-L12133)

node_modules/forge-std/src/safeconsole.sol#L12093-L12134


 - [ ] ID-316
[safeconsole.log(bool,bool,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L5987-L6014) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5993-L6005)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6007-L6013)

node_modules/forge-std/src/safeconsole.sol#L5987-L6014


 - [ ] ID-317
[LowLevelCall.returnData()](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L104-L111) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L105-L110)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L104-L111


 - [ ] ID-318
[safeconsole.log(bool,uint256,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L6657-L6684) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6663-L6675)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6677-L6683)

node_modules/forge-std/src/safeconsole.sol#L6657-L6684


 - [ ] ID-319
[safeconsole.log(bool,uint256,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L6873-L6914) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6881-L6903)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6905-L6913)

node_modules/forge-std/src/safeconsole.sol#L6873-L6914


 - [ ] ID-320
[safeconsole.log(bool,address,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L5649-L5690) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5657-L5679)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5681-L5689)

node_modules/forge-std/src/safeconsole.sol#L5649-L5690


 - [ ] ID-321
[safeconsole.log(bytes32,bytes32,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L12907-L12955) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12917-L12942)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12944-L12954)

node_modules/forge-std/src/safeconsole.sol#L12907-L12955


 - [ ] ID-322
[safeconsole.log(uint256,bytes32,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L9861-L9902) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9869-L9891)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9893-L9901)

node_modules/forge-std/src/safeconsole.sol#L9861-L9902


 - [ ] ID-323
[safeconsole.log(bool,uint256,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L6916-L6964) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6926-L6951)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6953-L6963)

node_modules/forge-std/src/safeconsole.sol#L6916-L6964


 - [ ] ID-324
[safeconsole.log(bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L312-L331) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L316-L324)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L326-L330)

node_modules/forge-std/src/safeconsole.sol#L312-L331


 - [ ] ID-325
[safeconsole.log(bytes32,uint256,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L11778-L11826) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11788-L11813)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11815-L11825)

node_modules/forge-std/src/safeconsole.sol#L11778-L11826


 - [ ] ID-326
[safeconsole.log(bool,address,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L5317-L5344) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5323-L5335)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5337-L5343)

node_modules/forge-std/src/safeconsole.sol#L5317-L5344


 - [ ] ID-327
[safeconsole.log(bool,bytes32,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L7274-L7322) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7284-L7309)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7311-L7321)

node_modules/forge-std/src/safeconsole.sol#L7274-L7322


 - [ ] ID-328
[safeconsole.log(bytes32,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L2330-L2367) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2337-L2357)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2359-L2366)

node_modules/forge-std/src/safeconsole.sol#L2330-L2367


 - [ ] ID-329
[safeconsole.log(bytes32,bytes32,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L12857-L12905) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12867-L12892)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12894-L12904)

node_modules/forge-std/src/safeconsole.sol#L12857-L12905


 - [ ] ID-330
[StorageSlot.getBytesSlot(bytes)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L138-L142) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L139-L141)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L138-L142


 - [ ] ID-331
[safeconsole.log(bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L571-L611) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L579-L600)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L602-L610)

node_modules/forge-std/src/safeconsole.sol#L571-L611


 - [ ] ID-332
[safeconsole.log(uint256,address,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L8028-L8055) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8034-L8046)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8048-L8054)

node_modules/forge-std/src/safeconsole.sol#L8028-L8055


 - [ ] ID-333
[safeconsole.log(address,bytes32,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L4873-L4914) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4881-L4903)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4905-L4913)

node_modules/forge-std/src/safeconsole.sol#L4873-L4914


 - [ ] ID-334
[safeconsole.log(uint256,address,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L7970-L7997) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7976-L7988)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7990-L7996)

node_modules/forge-std/src/safeconsole.sol#L7970-L7997


 - [ ] ID-335
[safeconsole.log(bool,uint256,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L6787-L6828) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6795-L6817)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6819-L6827)

node_modules/forge-std/src/safeconsole.sol#L6787-L6828


 - [ ] ID-336
[safeconsole.log(bool,uint256,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L6455-L6482) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6461-L6473)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6475-L6481)

node_modules/forge-std/src/safeconsole.sol#L6455-L6482


 - [ ] ID-337
[safeconsole.log(bytes32,uint256,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L11871-L11912) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11879-L11901)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11903-L11911)

node_modules/forge-std/src/safeconsole.sol#L11871-L11912


 - [ ] ID-338
[safeconsole.log(bool,address)](node_modules/forge-std/src/safeconsole.sol#L270-L289) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L274-L282)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L284-L288)

node_modules/forge-std/src/safeconsole.sol#L270-L289


 - [ ] ID-339
[Math.mulDiv(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L229-L236)
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L242-L251)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L206-L277


 - [ ] ID-340
[safeconsole.log(uint256,address,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L8143-L8184) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8151-L8173)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8175-L8183)

node_modules/forge-std/src/safeconsole.sol#L8143-L8184


 - [ ] ID-341
[Initializable._getInitializableStorage()](node_modules/@openzeppelin/contracts/proxy/utils/Initializable.sol#L232-L237) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/proxy/utils/Initializable.sol#L234-L236)

node_modules/@openzeppelin/contracts/proxy/utils/Initializable.sol#L232-L237


 - [ ] ID-342
[ERC20Upgradeable._getERC20Storage()](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L46-L50) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L47-L49)

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L46-L50


 - [ ] ID-343
[StdCheatsSafe.deployCode(string,bytes,uint256)](node_modules/forge-std/src/StdCheats.sol#L537-L544) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdCheats.sol#L539-L541)

node_modules/forge-std/src/StdCheats.sol#L537-L544


 - [ ] ID-344
[safeconsole.log(bytes32,bool,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L11034-L11082) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11044-L11069)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11071-L11081)

node_modules/forge-std/src/safeconsole.sol#L11034-L11082


 - [ ] ID-345
[Math.mul512(uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L37-L46) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L41-L45)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L37-L46


 - [ ] ID-346
[safeconsole.log(address,bytes32,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L4959-L5000) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4967-L4989)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4991-L4999)

node_modules/forge-std/src/safeconsole.sol#L4959-L5000


 - [ ] ID-347
[safeconsole.log(uint256,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L2043-L2080) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2050-L2070)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2072-L2079)

node_modules/forge-std/src/safeconsole.sol#L2043-L2080


 - [ ] ID-348
[safeconsole._sendLogPayloadView(uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L20-L24) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L21-L23)

node_modules/forge-std/src/safeconsole.sol#L20-L24


 - [ ] ID-349
[safeconsole.log(uint256,bytes32,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L9639-L9680) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9647-L9669)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9671-L9679)

node_modules/forge-std/src/safeconsole.sol#L9639-L9680


 - [ ] ID-350
[safeconsole.log(bytes32,address,address,bool)](node_modules/forge-std/src/safeconsole.sol#L10204-L10245) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10212-L10234)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10236-L10244)

node_modules/forge-std/src/safeconsole.sol#L10204-L10245


 - [ ] ID-351
[StdCheatsSafe.deployCode(string)](node_modules/forge-std/src/StdCheats.sol#L527-L534) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdCheats.sol#L529-L531)

node_modules/forge-std/src/StdCheats.sol#L527-L534


 - [ ] ID-352
[Memory.toBytes(Memory.Slice)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L98-L107) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L101-L106)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L98-L107


 - [ ] ID-353
[safeconsole.log(bytes32,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L2755-L2806) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2766-L2792)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2794-L2805)

node_modules/forge-std/src/safeconsole.sol#L2755-L2806


 - [ ] ID-354
[StorageSlot.getStringSlot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L111-L115) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L112-L114)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L111-L115


 - [ ] ID-355
[safeconsole.log(bytes32,address,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L10648-L10696) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10658-L10683)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10685-L10695)

node_modules/forge-std/src/safeconsole.sol#L10648-L10696


 - [ ] ID-356
[safeconsole.log(bytes32,uint256,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L11957-L12005) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11967-L11992)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11994-L12004)

node_modules/forge-std/src/safeconsole.sol#L11957-L12005


 - [ ] ID-357
[safeconsole.log(bool,bool,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L5915-L5956) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5923-L5945)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5947-L5955)

node_modules/forge-std/src/safeconsole.sol#L5915-L5956


 - [ ] ID-358
[StdUtils.getTokenBalances(address,address[])](node_modules/forge-std/src/StdUtils.sol#L173-L200) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdUtils.sol#L179-L181)

node_modules/forge-std/src/StdUtils.sol#L173-L200


 - [ ] ID-359
[safeconsole.log(bool,bytes32,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L7410-L7451) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7418-L7440)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7442-L7450)

node_modules/forge-std/src/safeconsole.sol#L7410-L7451


 - [ ] ID-360
[safeconsole.log(bytes32,uint256,address,bool)](node_modules/forge-std/src/safeconsole.sol#L11692-L11733) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11700-L11722)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11724-L11732)

node_modules/forge-std/src/safeconsole.sol#L11692-L11733


 - [ ] ID-361
[LowLevelCall.delegatecallNoReturn(address,bytes)](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L74-L78) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L75-L77)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L74-L78


 - [ ] ID-362
[safeconsole.log(bytes32,address,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L10798-L10846) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10808-L10833)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10835-L10845)

node_modules/forge-std/src/safeconsole.sol#L10798-L10846


 - [ ] ID-363
[Memory._pointer(Memory.Slice)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L144-L148) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L145-L147)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L144-L148


 - [ ] ID-364
[safeconsole.log(uint256,bytes32,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L9503-L9544) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9511-L9533)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9535-L9543)

node_modules/forge-std/src/safeconsole.sol#L9503-L9544


 - [ ] ID-365
[safeconsole.log(address,address,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L3327-L3375) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3337-L3362)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3364-L3374)

node_modules/forge-std/src/safeconsole.sol#L3327-L3375


 - [ ] ID-366
[safeconsole.log(uint256,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L1698-L1735) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1705-L1725)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1727-L1734)

node_modules/forge-std/src/safeconsole.sol#L1698-L1735


 - [ ] ID-367
[safeconsole.log(uint256,address,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L8186-L8227) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8194-L8216)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8218-L8226)

node_modules/forge-std/src/safeconsole.sol#L8186-L8227


 - [ ] ID-368
[safeconsole.log(bool,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L1168-L1191) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1173-L1183)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1185-L1190)

node_modules/forge-std/src/safeconsole.sol#L1168-L1191


 - [ ] ID-369
[safeconsole.log(bytes32,bool,address)](node_modules/forge-std/src/safeconsole.sol#L2291-L2328) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2298-L2318)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2320-L2327)

node_modules/forge-std/src/safeconsole.sol#L2291-L2328


 - [ ] ID-370
[safeconsole.log(uint256,bytes32,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L9904-L9952) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9914-L9939)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9941-L9951)

node_modules/forge-std/src/safeconsole.sol#L9904-L9952


 - [ ] ID-371
[safeconsole.log(bytes32,uint256,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L12286-L12334) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12296-L12321)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12323-L12333)

node_modules/forge-std/src/safeconsole.sol#L12286-L12334


 - [ ] ID-372
[safeconsole.log(uint256,bytes32,address,address)](node_modules/forge-std/src/safeconsole.sol#L9417-L9458) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9425-L9447)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9449-L9457)

node_modules/forge-std/src/safeconsole.sol#L9417-L9458


 - [ ] ID-373
[safeconsole.log(bool,address,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L5418-L5445) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5424-L5436)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5438-L5444)

node_modules/forge-std/src/safeconsole.sol#L5418-L5445


 - [ ] ID-374
[safeconsole.log(bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L466-L499) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L472-L490)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L492-L498)

node_modules/forge-std/src/safeconsole.sol#L466-L499


 - [ ] ID-375
[safeconsole.log(bytes32,uint256,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L12136-L12184) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12146-L12171)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12173-L12183)

node_modules/forge-std/src/safeconsole.sol#L12136-L12184


 - [ ] ID-376
[safeconsole.log(uint256,bytes32,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L10054-L10102) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10064-L10089)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10091-L10101)

node_modules/forge-std/src/safeconsole.sol#L10054-L10102


 - [ ] ID-377
[safeconsole.log(uint256,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L1851-L1874) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1856-L1866)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1868-L1873)

node_modules/forge-std/src/safeconsole.sol#L1851-L1874


 - [ ] ID-378
[safeconsole.log(uint256,bytes32,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L9546-L9594) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9556-L9581)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9583-L9593)

node_modules/forge-std/src/safeconsole.sol#L9546-L9594


 - [ ] ID-379
[safeconsole.log(bytes32,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L2369-L2406) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2376-L2396)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2398-L2405)

node_modules/forge-std/src/safeconsole.sol#L2369-L2406


 - [ ] ID-380
[safeconsole.log(bytes32,bool,address,address)](node_modules/forge-std/src/safeconsole.sol#L10905-L10946) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10913-L10935)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10937-L10945)

node_modules/forge-std/src/safeconsole.sol#L10905-L10946


 - [ ] ID-381
[safeconsole.log(bytes32,address,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L10848-L10903) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10860-L10888)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10890-L10902)

node_modules/forge-std/src/safeconsole.sol#L10848-L10903


 - [ ] ID-382
[safeconsole.log(uint256,uint256,address,bool)](node_modules/forge-std/src/safeconsole.sol#L8877-L8904) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8883-L8895)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8897-L8903)

node_modules/forge-std/src/safeconsole.sol#L8877-L8904


 - [ ] ID-383
[safeconsole.log(bool,uint256,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L6484-L6525) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6492-L6514)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6516-L6524)

node_modules/forge-std/src/safeconsole.sol#L6484-L6525


 - [ ] ID-384
[safeconsole._memcopy(uint256,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L26-L33) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L29-L31)

node_modules/forge-std/src/safeconsole.sol#L26-L33


 - [ ] ID-385
[safeconsole.log(address,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L802-L839) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L809-L829)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L831-L838)

node_modules/forge-std/src/safeconsole.sol#L802-L839


 - [ ] ID-386
[safeconsole.log(address,bool,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L3767-L3808) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3775-L3797)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3799-L3807)

node_modules/forge-std/src/safeconsole.sol#L3767-L3808


 - [ ] ID-387
[safeconsole.log(address,address,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L3155-L3196) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3163-L3185)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3187-L3195)

node_modules/forge-std/src/safeconsole.sol#L3155-L3196


 - [ ] ID-388
[safeconsole.log(address,address)](node_modules/forge-std/src/safeconsole.sol#L172-L191) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L176-L184)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L186-L190)

node_modules/forge-std/src/safeconsole.sol#L172-L191


 - [ ] ID-389
[safeconsole.log(uint256,bool,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L8669-L8710) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8677-L8699)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8701-L8709)

node_modules/forge-std/src/safeconsole.sol#L8669-L8710


 - [ ] ID-390
[safeconsole.log(address,bool,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L3536-L3563) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3542-L3554)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3556-L3562)

node_modules/forge-std/src/safeconsole.sol#L3536-L3563


 - [ ] ID-391
[safeconsole.log(address,uint256,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L4105-L4132) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4111-L4123)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4125-L4131)

node_modules/forge-std/src/safeconsole.sol#L4105-L4132


 - [ ] ID-392
[safeconsole.log(bytes32,address,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L10469-L10517) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10479-L10504)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10506-L10516)

node_modules/forge-std/src/safeconsole.sol#L10469-L10517


 - [ ] ID-393
[console._sendLogPayloadImplementation(bytes)](node_modules/forge-std/src/console.sol#L7-L12) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/console.sol#L9-L11)

node_modules/forge-std/src/console.sol#L7-L12


 - [ ] ID-394
[safeconsole.log(address,bool,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L3565-L3592) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3571-L3583)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3585-L3591)

node_modules/forge-std/src/safeconsole.sol#L3565-L3592


 - [ ] ID-395
[safeconsole.log(uint256,bool,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L8626-L8667) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8634-L8656)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8658-L8666)

node_modules/forge-std/src/safeconsole.sol#L8626-L8667


 - [ ] ID-396
[safeconsole.log(uint256,uint256,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L9137-L9164) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9143-L9155)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9157-L9163)

node_modules/forge-std/src/safeconsole.sol#L9137-L9164


 - [ ] ID-397
[safeconsole.log(bytes32,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L2245-L2289) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2254-L2277)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2279-L2288)

node_modules/forge-std/src/safeconsole.sol#L2245-L2289


 - [ ] ID-398
[safeconsole.log(uint256,bytes32,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L9725-L9773) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9735-L9760)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9762-L9772)

node_modules/forge-std/src/safeconsole.sol#L9725-L9773


 - [ ] ID-399
[safeconsole.log(uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L410-L429) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L414-L422)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L424-L428)

node_modules/forge-std/src/safeconsole.sol#L410-L429


 - [ ] ID-400
[safeconsole.log(bool,address,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L5548-L5575) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5554-L5566)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5568-L5574)

node_modules/forge-std/src/safeconsole.sol#L5548-L5575


 - [ ] ID-401
[safeconsole.log(address,bytes32,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L4823-L4871) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4833-L4858)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4860-L4870)

node_modules/forge-std/src/safeconsole.sol#L4823-L4871


 - [ ] ID-402
[safeconsole.log(uint256,address,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L7869-L7896) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7875-L7887)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7889-L7895)

node_modules/forge-std/src/safeconsole.sol#L7869-L7896


 - [ ] ID-403
[safeconsole.log(address,uint256,bool,address)](node_modules/forge-std/src/safeconsole.sol#L4076-L4103) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4082-L4094)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4096-L4102)

node_modules/forge-std/src/safeconsole.sol#L4076-L4103


 - [ ] ID-404
[safeconsole.log(uint256,bool,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L8438-L8465) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8444-L8456)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8458-L8464)

node_modules/forge-std/src/safeconsole.sol#L8438-L8465


 - [ ] ID-405
[safeconsole.log(uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L431-L464) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L437-L455)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L457-L463)

node_modules/forge-std/src/safeconsole.sol#L431-L464


 - [ ] ID-406
[StdUtils._castLogPayloadViewToPure(function(bytes))](node_modules/forge-std/src/StdUtils.sol#L213-L221) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdUtils.sol#L218-L220)

node_modules/forge-std/src/StdUtils.sol#L213-L221


 - [ ] ID-407
[StorageSlot.getStringSlot(string)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L120-L124) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L121-L123)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L120-L124


 - [ ] ID-408
[safeconsole.log(bool,bool,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L6261-L6302) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6269-L6291)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6293-L6301)

node_modules/forge-std/src/safeconsole.sol#L6261-L6302


 - [ ] ID-409
[safeconsole.log(bytes32,bool,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L11392-L11440) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11402-L11427)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11429-L11439)

node_modules/forge-std/src/safeconsole.sol#L11392-L11440


 - [ ] ID-410
[safeconsole.log(uint256,uint256,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L9065-L9106) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9073-L9095)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9097-L9105)

node_modules/forge-std/src/safeconsole.sol#L9065-L9106


 - [ ] ID-411
[safeconsole.log(bytes32,uint256,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L12050-L12091) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12058-L12080)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12082-L12090)

node_modules/forge-std/src/safeconsole.sol#L12050-L12091


 - [ ] ID-412
[safeconsole.log(uint256,bytes32,bool,address)](node_modules/forge-std/src/safeconsole.sol#L9596-L9637) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9604-L9626)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9628-L9636)

node_modules/forge-std/src/safeconsole.sol#L9596-L9637


 - [ ] ID-413
[safeconsole.log(address,bytes32,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L5102-L5150) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5112-L5137)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5139-L5149)

node_modules/forge-std/src/safeconsole.sol#L5102-L5150


 - [ ] ID-414
[safeconsole.log(bool,bool)](node_modules/forge-std/src/safeconsole.sol#L291-L310) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L295-L303)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L305-L309)

node_modules/forge-std/src/safeconsole.sol#L291-L310


 - [ ] ID-415
[safeconsole.log(uint256,address,bool,address)](node_modules/forge-std/src/safeconsole.sol#L7840-L7867) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7846-L7858)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7860-L7866)

node_modules/forge-std/src/safeconsole.sol#L7840-L7867


 - [ ] ID-416
[Math.tryMul(uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L73-L84) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L76-L80)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L73-L84


 - [ ] ID-417
[safeconsole.log(bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L536-L569) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L542-L560)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L562-L568)

node_modules/forge-std/src/safeconsole.sol#L536-L569


 - [ ] ID-418
[safeconsole.log(uint256,bool,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L8496-L8537) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8504-L8526)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8528-L8536)

node_modules/forge-std/src/safeconsole.sol#L8496-L8537


 - [ ] ID-419
[safeconsole.log(bool,address,address)](node_modules/forge-std/src/safeconsole.sol#L1118-L1141) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1123-L1133)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1135-L1140)

node_modules/forge-std/src/safeconsole.sol#L1118-L1141


 - [ ] ID-420
[safeconsole.log(bytes32,uint256,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L12186-L12234) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12196-L12221)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12223-L12233)

node_modules/forge-std/src/safeconsole.sol#L12186-L12234


 - [ ] ID-421
[safeconsole.log(bytes32,bytes32,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L13185-L13247) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13199-L13230)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13232-L13246)

node_modules/forge-std/src/safeconsole.sol#L13185-L13247


 - [ ] ID-422
[safeconsole.log(bytes32,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L2206-L2243) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2213-L2233)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2235-L2242)

node_modules/forge-std/src/safeconsole.sol#L2206-L2243


 - [ ] ID-423
[LowLevelCall.bubbleRevert(bytes)](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L122-L126) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L123-L125)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L122-L126


 - [ ] ID-424
[safeconsole.log(bool,bytes32,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L7653-L7708) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7665-L7693)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7695-L7707)

node_modules/forge-std/src/safeconsole.sol#L7653-L7708


 - [ ] ID-425
[safeconsole.log(bytes32,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L2493-L2530) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2500-L2520)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2522-L2529)

node_modules/forge-std/src/safeconsole.sol#L2493-L2530


 - [ ] ID-426
[Math.tryMod(uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102-L110) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L105-L108)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L102-L110


 - [ ] ID-427
[safeconsole.log(address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L235-L268) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L241-L259)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L261-L267)

node_modules/forge-std/src/safeconsole.sol#L235-L268


 - [ ] ID-428
[StdCheatsSafe.assumeNotBlacklisted(address,address)](node_modules/forge-std/src/StdCheats.sol#L207-L225) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdCheats.sol#L210-L212)

node_modules/forge-std/src/StdCheats.sol#L207-L225


 - [ ] ID-429
[safeconsole.log(address,uint256,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L4033-L4074) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4041-L4063)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4065-L4073)

node_modules/forge-std/src/safeconsole.sol#L4033-L4074


 - [ ] ID-430
[safeconsole.log(bytes32,bytes32,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L12493-L12541) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12503-L12528)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12530-L12540)

node_modules/forge-std/src/safeconsole.sol#L12493-L12541


 - [ ] ID-431
[StdCheatsSafe._viewChainId()](node_modules/forge-std/src/StdCheats.sol#L648-L655) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdCheats.sol#L650-L652)

node_modules/forge-std/src/StdCheats.sol#L648-L655


 - [ ] ID-432
[Math.tryDiv(uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L89-L97) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L92-L95)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L89-L97


 - [ ] ID-433
[safeconsole.log(bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L333-L366) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L339-L357)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L359-L365)

node_modules/forge-std/src/safeconsole.sol#L333-L366


 - [ ] ID-434
[safeconsole.log(bytes32,bool,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L10991-L11032) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10999-L11021)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11023-L11031)

node_modules/forge-std/src/safeconsole.sol#L10991-L11032


 - [ ] ID-435
[safeconsole.logMemory(uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L41-L88) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L47-L55)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L57-L61)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L68-L72)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L74-L79)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L82-L86)

node_modules/forge-std/src/safeconsole.sol#L41-L88


 - [ ] ID-436
[safeconsole.log(address,uint256,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L4293-L4334) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4301-L4323)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4325-L4333)

node_modules/forge-std/src/safeconsole.sol#L4293-L4334


 - [ ] ID-437
[StorageSlot.getBytesSlot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L129-L133) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L130-L132)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L129-L133


 - [ ] ID-438
[console._castToPure(function(bytes))](node_modules/forge-std/src/console.sol#L14-L22) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/console.sol#L19-L21)

node_modules/forge-std/src/console.sol#L14-L22


 - [ ] ID-439
[safeconsole.log(bytes32,bytes32,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L12750-L12805) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12762-L12790)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L12792-L12804)

node_modules/forge-std/src/safeconsole.sol#L12750-L12805


 - [ ] ID-440
[safeconsole.log(uint256,uint256,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L8906-L8933) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8912-L8924)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8926-L8932)

node_modules/forge-std/src/safeconsole.sol#L8906-L8933


 - [ ] ID-441
[safeconsole.log(address,bytes32,uint256)](node_modules/forge-std/src/safeconsole.sol#L1033-L1070) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1040-L1060)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1062-L1069)

node_modules/forge-std/src/safeconsole.sol#L1033-L1070


 - [ ] ID-442
[safeconsole.log(bool,bool,bool,address)](node_modules/forge-std/src/safeconsole.sol#L5958-L5985) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5964-L5976)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5978-L5984)

node_modules/forge-std/src/safeconsole.sol#L5958-L5985


 - [ ] ID-443
[LowLevelCall.returnDataSize()](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L97-L101) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L98-L100)

node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L97-L101


 - [ ] ID-444
[safeconsole.log(bytes32,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L2663-L2707) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2672-L2695)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2697-L2706)

node_modules/forge-std/src/safeconsole.sol#L2663-L2707


 - [ ] ID-445
[safeconsole.log(uint256,bool,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L8467-L8494) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8473-L8485)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8487-L8493)

node_modules/forge-std/src/safeconsole.sol#L8467-L8494


 - [ ] ID-446
[Math._zeroBytes(bytes)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L478-L490) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L482-L484)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L478-L490


 - [ ] ID-447
[safeconsole.log(bytes32,address,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L10247-L10288) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10255-L10277)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10279-L10287)

node_modules/forge-std/src/safeconsole.sol#L10247-L10288


 - [ ] ID-448
[Math.tryModExp(uint256,uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L411-L435) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L413-L434)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L411-L435


 - [ ] ID-449
[safeconsole.log(address,bytes32,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L4780-L4821) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4788-L4810)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4812-L4820)

node_modules/forge-std/src/safeconsole.sol#L4780-L4821


 - [ ] ID-450
[safeconsole.log(uint256,uint256,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L9007-L9034) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9013-L9025)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9027-L9033)

node_modules/forge-std/src/safeconsole.sol#L9007-L9034


 - [ ] ID-451
[safeconsole.log(address,bytes32,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L4916-L4957) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4924-L4946)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4948-L4956)

node_modules/forge-std/src/safeconsole.sol#L4916-L4957


 - [ ] ID-452
[safeconsole.log(address,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L891-L914) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L896-L906)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L908-L913)

node_modules/forge-std/src/safeconsole.sol#L891-L914


 - [ ] ID-453
[safeconsole.log(uint256,bool,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L8539-L8566) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8545-L8557)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8559-L8565)

node_modules/forge-std/src/safeconsole.sol#L8539-L8566


 - [ ] ID-454
[safeconsole.log(address,bytes32,address,address)](node_modules/forge-std/src/safeconsole.sol#L4515-L4556) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4523-L4545)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4547-L4555)

node_modules/forge-std/src/safeconsole.sol#L4515-L4556


 - [ ] ID-455
[safeconsole.log(bytes32,bytes32,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L13071-L13126) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13083-L13111)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L13113-L13125)

node_modules/forge-std/src/safeconsole.sol#L13071-L13126


 - [ ] ID-456
[safeconsole.log(bool,bool,address)](node_modules/forge-std/src/safeconsole.sol#L1232-L1255) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1237-L1247)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L1249-L1254)

node_modules/forge-std/src/safeconsole.sol#L1232-L1255


 - [ ] ID-457
[safeconsole.log(uint256,address,address,bytes32)](node_modules/forge-std/src/safeconsole.sol#L7797-L7838) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7805-L7827)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7829-L7837)

node_modules/forge-std/src/safeconsole.sol#L7797-L7838


 - [ ] ID-458
[SafeERC20._safeTransferFrom(IERC20,address,address,uint256,bool)](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L212-L244) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L221-L243)

node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L212-L244


 - [ ] ID-459
[safeconsole.log(uint256,bool,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L8597-L8624) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8603-L8615)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8617-L8623)

node_modules/forge-std/src/safeconsole.sol#L8597-L8624


 - [ ] ID-460
[stdStorageSafe._flatten(bytes32[])](node_modules/forge-std/src/StdStorage.sol#L316-L326) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdStorage.sol#L320-L322)

node_modules/forge-std/src/StdStorage.sol#L316-L326


 - [ ] ID-461
[safeconsole.log(uint256,uint256,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L9367-L9415) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9377-L9402)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L9404-L9414)

node_modules/forge-std/src/safeconsole.sol#L9367-L9415


 - [ ] ID-462
[safeconsole.log(address,address,address,address)](node_modules/forge-std/src/safeconsole.sol#L2808-L2835) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2814-L2826)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L2828-L2834)

node_modules/forge-std/src/safeconsole.sol#L2808-L2835


 - [ ] ID-463
[safeconsole.log(address,bytes32,bool,bool)](node_modules/forge-std/src/safeconsole.sol#L4737-L4778) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4745-L4767)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4769-L4777)

node_modules/forge-std/src/safeconsole.sol#L4737-L4778


 - [ ] ID-464
[safeconsole.log(address,uint256,bytes32)](node_modules/forge-std/src/safeconsole.sol#L916-L953) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L923-L943)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L945-L952)

node_modules/forge-std/src/safeconsole.sol#L916-L953


 - [ ] ID-465
[Memory.unsafeSetFreeMemoryPointer(Memory.Pointer)](node_modules/@openzeppelin/contracts/utils/Memory.sol#L39-L43) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L40-L42)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L39-L43


 - [ ] ID-466
[safeconsole.log(address,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L777-L800) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L782-L792)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L794-L799)

node_modules/forge-std/src/safeconsole.sol#L777-L800


 - [ ] ID-467
[safeconsole.log(bytes32,address,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L10426-L10467) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10434-L10456)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10458-L10466)

node_modules/forge-std/src/safeconsole.sol#L10426-L10467


 - [ ] ID-468
[Proxy._delegate(address)](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L22-L45) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L23-L44)

node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L22-L45


 - [ ] ID-469
[safeconsole.log(bytes32,bool,bytes32,address)](node_modules/forge-std/src/safeconsole.sol#L11442-L11490) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11452-L11477)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11479-L11489)

node_modules/forge-std/src/safeconsole.sol#L11442-L11490


 - [ ] ID-470
[Math.add512(uint256,uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L25-L30) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L26-L29)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L25-L30


 - [ ] ID-471
[safeconsole.log(bytes32,address,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L10748-L10796) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10758-L10783)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L10785-L10795)

node_modules/forge-std/src/safeconsole.sol#L10748-L10796


 - [ ] ID-472
[StdCheatsSafe.deployCode(string,uint256)](node_modules/forge-std/src/StdCheats.sol#L547-L554) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/StdCheats.sol#L549-L551)

node_modules/forge-std/src/StdCheats.sol#L547-L554


 - [ ] ID-473
[safeconsole.log(address,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L663-L686) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L668-L678)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L680-L685)

node_modules/forge-std/src/safeconsole.sol#L663-L686


 - [ ] ID-474
[safeconsole.log(uint256,address,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L8229-L8277) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8239-L8264)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L8266-L8276)

node_modules/forge-std/src/safeconsole.sol#L8229-L8277


 - [ ] ID-475
[safeconsole.log(bytes32,uint256,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L11735-L11776) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11743-L11765)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11767-L11775)

node_modules/forge-std/src/safeconsole.sol#L11735-L11776


 - [ ] ID-476
[safeconsole.log(bool,bool,uint256,uint256)](node_modules/forge-std/src/safeconsole.sol#L6146-L6173) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6152-L6164)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L6166-L6172)

node_modules/forge-std/src/safeconsole.sol#L6146-L6173


 - [ ] ID-477
[safeconsole.log(address,uint256,uint256,address)](node_modules/forge-std/src/safeconsole.sol#L4206-L4233) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4212-L4224)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4226-L4232)

node_modules/forge-std/src/safeconsole.sol#L4206-L4233


 - [ ] ID-478
[safeconsole.log(address,bool,address,uint256)](node_modules/forge-std/src/safeconsole.sol#L3435-L3462) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3441-L3453)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3455-L3461)

node_modules/forge-std/src/safeconsole.sol#L3435-L3462


 - [ ] ID-479
[safeconsole.log(address,bool,bytes32,bytes32)](node_modules/forge-std/src/safeconsole.sol#L3896-L3944) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3906-L3931)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3933-L3943)

node_modules/forge-std/src/safeconsole.sol#L3896-L3944


 - [ ] ID-480
[safeconsole.log(uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L389-L408) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L393-L401)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L403-L407)

node_modules/forge-std/src/safeconsole.sol#L389-L408


 - [ ] ID-481
[safeconsole.log(uint256)](node_modules/forge-std/src/safeconsole.sol#L124-L139) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L127-L133)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L135-L138)

node_modules/forge-std/src/safeconsole.sol#L124-L139


 - [ ] ID-482
[safeconsole.log(bool,address,bool,address)](node_modules/forge-std/src/safeconsole.sol#L5389-L5416) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5395-L5407)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L5409-L5415)

node_modules/forge-std/src/safeconsole.sol#L5389-L5416


 - [ ] ID-483
[safeconsole.log(address,uint256,uint256,bool)](node_modules/forge-std/src/safeconsole.sol#L4235-L4262) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4241-L4253)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L4255-L4261)

node_modules/forge-std/src/safeconsole.sol#L4235-L4262


 - [ ] ID-484
[safeconsole.log(bytes32,uint256,address,address)](node_modules/forge-std/src/safeconsole.sol#L11649-L11690) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11657-L11679)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L11681-L11689)

node_modules/forge-std/src/safeconsole.sol#L11649-L11690


 - [ ] ID-485
[safeconsole.log(address,bool,bool,bytes32)](node_modules/forge-std/src/safeconsole.sol#L3594-L3635) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3602-L3624)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3626-L3634)

node_modules/forge-std/src/safeconsole.sol#L3594-L3635


 - [ ] ID-486
[Memory.getFreeMemoryPointer()](node_modules/@openzeppelin/contracts/utils/Memory.sol#L24-L28) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Memory.sol#L25-L27)

node_modules/@openzeppelin/contracts/utils/Memory.sol#L24-L28


 - [ ] ID-487
[safeconsole.log(bool,bytes32,bytes32,bool)](node_modules/forge-std/src/safeconsole.sol#L7553-L7601) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7563-L7588)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L7590-L7600)

node_modules/forge-std/src/safeconsole.sol#L7553-L7601


 - [ ] ID-488
[safeconsole.log(address,address,bool,uint256)](node_modules/forge-std/src/safeconsole.sol#L2996-L3023) uses assembly
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3002-L3014)
	- [INLINE ASM](node_modules/forge-std/src/safeconsole.sol#L3016-L3022)

node_modules/forge-std/src/safeconsole.sol#L2996-L3023


## boolean-equal
Impact: Informational
Confidence: High
 - [ ] ID-489
[StdCheatsSafe.assumeNotBlacklisted(address,address)](node_modules/forge-std/src/StdCheats.sol#L207-L225) compares to a boolean constant:
	-[vm.assume(! success || abi.decode(returnData,(bool)) == false)](node_modules/forge-std/src/StdCheats.sol#L220)

node_modules/forge-std/src/StdCheats.sol#L207-L225


 - [ ] ID-490
[StdCheatsSafe.assumeNotBlacklisted(address,address)](node_modules/forge-std/src/StdCheats.sol#L207-L225) compares to a boolean constant:
	-[vm.assume(! success || abi.decode(returnData,(bool)) == false)](node_modules/forge-std/src/StdCheats.sol#L224)

node_modules/forge-std/src/StdCheats.sol#L207-L225


## pragma
Impact: Informational
Confidence: High
 - [ ] ID-491
10 different versions of Solidity are used:
	- Version constraint ^0.8.20 is used by:
		-[^0.8.20](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/access/Ownable.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/proxy/utils/Initializable.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/utils/Address.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/utils/Context.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/utils/Errors.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/utils/Panic.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L5)
		-[^0.8.20](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L4)
		-[^0.8.20](node_modules/@openzeppelin/contracts/utils/math/SafeCast.sol#L5)
	- Version constraint ^0.8.24 is used by:
		-[^0.8.24](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L4)
		-[^0.8.24](node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol#L4)
		-[^0.8.24](node_modules/@openzeppelin/contracts/utils/Memory.sol#L4)
	- Version constraint >=0.6.2 is used by:
		-[>=0.6.2](node_modules/@openzeppelin/contracts/interfaces/IERC1363.sol#L4)
		-[>=0.6.2](node_modules/@openzeppelin/contracts/interfaces/IERC4626.sol#L4)
		-[>=0.6.2](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L4)
	- Version constraint >=0.4.16 is used by:
		-[>=0.4.16](node_modules/@openzeppelin/contracts/interfaces/IERC165.sol#L4)
		-[>=0.4.16](node_modules/@openzeppelin/contracts/interfaces/IERC20.sol#L4)
		-[>=0.4.16](node_modules/@openzeppelin/contracts/proxy/beacon/IBeacon.sol#L4)
		-[>=0.4.16](node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#L4)
		-[>=0.4.16](node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#L4)
	- Version constraint >=0.4.11 is used by:
		-[>=0.4.11](node_modules/@openzeppelin/contracts/interfaces/IERC1967.sol#L4)
	- Version constraint >=0.8.4 is used by:
		-[>=0.8.4](node_modules/@openzeppelin/contracts/interfaces/draft-IERC6093.sol#L4)
	- Version constraint ^0.8.22 is used by:
		-[^0.8.22](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol#L4)
		-[^0.8.22](node_modules/@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol#L4)
		-[^0.8.22](node_modules/@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol#L4)
	- Version constraint ^0.8.21 is used by:
		-[^0.8.21](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L4)
	- Version constraint >=0.8.13<0.9.0 is used by:
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/Base.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdAssertions.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdChains.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdCheats.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdConstants.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdError.sol#L3)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdInvariant.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdJson.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdMath.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdStorage.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdStyle.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdToml.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/StdUtils.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/Test.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/Vm.sol#L4)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/console.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/console2.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/interfaces/IMulticall3.sol#L2)
		-[>=0.8.13<0.9.0](node_modules/forge-std/src/safeconsole.sol#L2)
	- Version constraint ^0.8.0 is used by:
		-[^0.8.0](contracts/markets.sol#L2)
		-[^0.8.0](contracts/markets.t.sol#L2)
		-[^0.8.0](contracts/proxy.sol#L2)
		-[^0.8.0](contracts/tokens.sol#L2)
		-[^0.8.0](contracts/vaults.sol#L2)

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L4


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-492
Version constraint >=0.4.16 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- DirtyBytesArrayToStorage
	- ABIDecodeTwoDimensionalArrayMemory
	- KeccakCaching
	- EmptyByteArrayCopy
	- DynamicArrayCleanup
	- ImplicitConstructorCallvalueCheck
	- TupleAssignmentMultiStackSlotComponents
	- MemoryArrayCreationOverflow
	- privateCanBeOverridden
	- SignedArrayStorageCopy
	- ABIEncoderV2StorageArrayWithMultiSlotElement
	- DynamicConstructorArgumentsClippedABIV2
	- UninitializedFunctionPointerInConstructor_0.4.x
	- IncorrectEventSignatureInLibraries_0.4.x
	- ExpExponentCleanup
	- NestedArrayFunctionCallDecoder
	- ZeroFunctionSelector.
It is used by:
	- [>=0.4.16](node_modules/@openzeppelin/contracts/interfaces/IERC165.sol#L4)
	- [>=0.4.16](node_modules/@openzeppelin/contracts/interfaces/IERC20.sol#L4)
	- [>=0.4.16](node_modules/@openzeppelin/contracts/proxy/beacon/IBeacon.sol#L4)
	- [>=0.4.16](node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#L4)
	- [>=0.4.16](node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#L4)

node_modules/@openzeppelin/contracts/interfaces/IERC165.sol#L4


 - [ ] ID-493
Version constraint ^0.8.20 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess.
It is used by:
	- [^0.8.20](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/access/Ownable.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/proxy/utils/Initializable.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/utils/Address.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/utils/Context.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/utils/Errors.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/utils/LowLevelCall.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/utils/Panic.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L5)
	- [^0.8.20](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L4)
	- [^0.8.20](node_modules/@openzeppelin/contracts/utils/math/SafeCast.sol#L5)

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L4


 - [ ] ID-494
Version constraint ^0.8.22 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication.
It is used by:
	- [^0.8.22](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol#L4)
	- [^0.8.22](node_modules/@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol#L4)
	- [^0.8.22](node_modules/@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol#L4)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol#L4


 - [ ] ID-495
Version constraint >=0.4.11 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- DirtyBytesArrayToStorage
	- KeccakCaching
	- EmptyByteArrayCopy
	- DynamicArrayCleanup
	- ImplicitConstructorCallvalueCheck
	- TupleAssignmentMultiStackSlotComponents
	- MemoryArrayCreationOverflow
	- privateCanBeOverridden
	- SignedArrayStorageCopy
	- UninitializedFunctionPointerInConstructor_0.4.x
	- IncorrectEventSignatureInLibraries_0.4.x
	- ExpExponentCleanup
	- NestedArrayFunctionCallDecoder
	- ZeroFunctionSelector
	- DelegateCallReturnValue
	- ECRecoverMalformedInput
	- SkipEmptyStringLiteral.
It is used by:
	- [>=0.4.11](node_modules/@openzeppelin/contracts/interfaces/IERC1967.sol#L4)

node_modules/@openzeppelin/contracts/interfaces/IERC1967.sol#L4


 - [ ] ID-496
Version constraint >=0.6.2 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- MissingSideEffectsOnSelectorAccess
	- AbiReencodingHeadOverflowWithStaticArrayCleanup
	- DirtyBytesArrayToStorage
	- NestedCalldataArrayAbiReencodingSizeValidation
	- ABIDecodeTwoDimensionalArrayMemory
	- KeccakCaching
	- EmptyByteArrayCopy
	- DynamicArrayCleanup
	- MissingEscapingInFormatting
	- ArraySliceDynamicallyEncodedBaseType
	- ImplicitConstructorCallvalueCheck
	- TupleAssignmentMultiStackSlotComponents
	- MemoryArrayCreationOverflow.
It is used by:
	- [>=0.6.2](node_modules/@openzeppelin/contracts/interfaces/IERC1363.sol#L4)
	- [>=0.6.2](node_modules/@openzeppelin/contracts/interfaces/IERC4626.sol#L4)
	- [>=0.6.2](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L4)

node_modules/@openzeppelin/contracts/interfaces/IERC1363.sol#L4


 - [ ] ID-497
Version constraint >=0.8.4 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess
	- AbiReencodingHeadOverflowWithStaticArrayCleanup
	- DirtyBytesArrayToStorage
	- DataLocationChangeInInternalOverride
	- NestedCalldataArrayAbiReencodingSizeValidation
	- SignedImmutables.
It is used by:
	- [>=0.8.4](node_modules/@openzeppelin/contracts/interfaces/draft-IERC6093.sol#L4)

node_modules/@openzeppelin/contracts/interfaces/draft-IERC6093.sol#L4


 - [ ] ID-498
Version constraint ^0.8.0 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- FullInlinerNonExpressionSplitArgumentEvaluationOrder
	- MissingSideEffectsOnSelectorAccess
	- AbiReencodingHeadOverflowWithStaticArrayCleanup
	- DirtyBytesArrayToStorage
	- DataLocationChangeInInternalOverride
	- NestedCalldataArrayAbiReencodingSizeValidation
	- SignedImmutables
	- ABIDecodeTwoDimensionalArrayMemory
	- KeccakCaching.
It is used by:
	- [^0.8.0](contracts/markets.sol#L2)
	- [^0.8.0](contracts/markets.t.sol#L2)
	- [^0.8.0](contracts/proxy.sol#L2)
	- [^0.8.0](contracts/tokens.sol#L2)
	- [^0.8.0](contracts/vaults.sol#L2)

contracts/markets.sol#L2


 - [ ] ID-499
Version constraint ^0.8.21 contains known severe issues (https://solidity.readthedocs.io/en/latest/bugs.html)
	- VerbatimInvalidDeduplication.
It is used by:
	- [^0.8.21](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L4)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol#L4


 - [ ] ID-500
Version constraint >=0.8.13<0.9.0 is too complex.
It is used by:
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/Base.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdAssertions.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdChains.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdCheats.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdConstants.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdError.sol#L3)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdInvariant.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdJson.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdMath.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdStorage.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdStyle.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdToml.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/StdUtils.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/Test.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/Vm.sol#L4)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/console.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/console2.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/interfaces/IMulticall3.sol#L2)
	- [>=0.8.13<0.9.0](node_modules/forge-std/src/safeconsole.sol#L2)

node_modules/forge-std/src/Base.sol#L2


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-501
Low level call in [StdCheats.deployCodeTo(string,bytes,uint256,address)](node_modules/forge-std/src/StdCheats.sol#L909-L915):
	- [(success,runtimeBytecode) = where.call{value: value}()](node_modules/forge-std/src/StdCheats.sol#L912)

node_modules/forge-std/src/StdCheats.sol#L909-L915


 - [ ] ID-502
Low level call in [StdCheats._console2_log_StdCheats(string)](node_modules/forge-std/src/StdCheats.sol#L918-L921):
	- [(status,None) = address(_CONSOLE2_ADDRESS).staticcall(abi.encodeWithSignature(log(string),p0))](node_modules/forge-std/src/StdCheats.sol#L919)

node_modules/forge-std/src/StdCheats.sol#L918-L921


 - [ ] ID-503
Low level call in [StdCheatsSafe.assumeNotBlacklisted(address,address)](node_modules/forge-std/src/StdCheats.sol#L207-L225):
	- [(success,returnData) = token.staticcall(abi.encodeWithSelector(0xfe575a87,addr))](node_modules/forge-std/src/StdCheats.sol#L219)
	- [(success,returnData) = token.staticcall(abi.encodeWithSelector(0xe47d6060,addr))](node_modules/forge-std/src/StdCheats.sol#L223)

node_modules/forge-std/src/StdCheats.sol#L207-L225


 - [ ] ID-504
Low level call in [StdCheatsSafe._isPayable(address)](node_modules/forge-std/src/StdCheats.sol#L284-L300):
	- [(success,None) = address(addr).call{value: 1}()](node_modules/forge-std/src/StdCheats.sol#L293)

node_modules/forge-std/src/StdCheats.sol#L284-L300


 - [ ] ID-505
Low level call in [StdCheats.dealERC1155(address,address,uint256,uint256,bool)](node_modules/forge-std/src/StdCheats.sol#L847-L870):
	- [(None,balData) = token.staticcall(abi.encodeWithSelector(0x00fdd58e,to,id))](node_modules/forge-std/src/StdCheats.sol#L849)
	- [(None,totSupData) = token.staticcall(abi.encodeWithSelector(0xbd85b039,id))](node_modules/forge-std/src/StdCheats.sol#L857)

node_modules/forge-std/src/StdCheats.sol#L847-L870


 - [ ] ID-506
Low level call in [stdStorageSafe.callTarget(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L46-L52):
	- [(success,rdat) = self._target.staticcall(cd)](node_modules/forge-std/src/StdStorage.sol#L48)

node_modules/forge-std/src/StdStorage.sol#L46-L52


 - [ ] ID-507
Low level call in [StdCheats.dealERC721(address,address,uint256)](node_modules/forge-std/src/StdCheats.sol#L873-L893):
	- [(successMinted,ownerData) = token.staticcall(abi.encodeWithSelector(0x6352211e,id))](node_modules/forge-std/src/StdCheats.sol#L875)
	- [(None,fromBalData) = token.staticcall(abi.encodeWithSelector(0x70a08231,abi.decode(ownerData,(address))))](node_modules/forge-std/src/StdCheats.sol#L879-L880)
	- [(None,toBalData) = token.staticcall(abi.encodeWithSelector(0x70a08231,to))](node_modules/forge-std/src/StdCheats.sol#L884)

node_modules/forge-std/src/StdCheats.sol#L873-L893


 - [ ] ID-508
Low level call in [StdCheats.deal(address,address,uint256,bool)](node_modules/forge-std/src/StdCheats.sol#L825-L844):
	- [(None,balData) = token.staticcall(abi.encodeWithSelector(0x70a08231,to))](node_modules/forge-std/src/StdCheats.sol#L827)
	- [(None,totSupData) = token.staticcall(abi.encodeWithSelector(0x18160ddd))](node_modules/forge-std/src/StdCheats.sol#L835)

node_modules/forge-std/src/StdCheats.sol#L825-L844


 - [ ] ID-509
Low level call in [StdAssertions.assertEqCall(address,bytes,address,bytes,bool)](node_modules/forge-std/src/StdAssertions.sol#L1268-L1299):
	- [(successA,returnDataA) = address(targetA).call(callDataA)](node_modules/forge-std/src/StdAssertions.sol#L1275)
	- [(successB,returnDataB) = address(targetB).call(callDataB)](node_modules/forge-std/src/StdAssertions.sol#L1276)

node_modules/forge-std/src/StdAssertions.sol#L1268-L1299


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-510
Function [StdUtils._console2_log_StdUtils(string)](node_modules/forge-std/src/StdUtils.sol#L236-L238) is not in mixedCase

node_modules/forge-std/src/StdUtils.sol#L236-L238


 - [ ] ID-511
Parameter [stdStorage.sig(StdStorage,string)._sig](node_modules/forge-std/src/StdStorage.sol#L387) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L387


 - [ ] ID-512
Event [StdAssertions.log_named_uint(string,uint256)](node_modules/forge-std/src/StdAssertions.sol#L25) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L25


 - [ ] ID-513
Function [stdStorageSafe.enable_packed_slots(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L217-L220) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L217-L220


 - [ ] ID-514
Function [stdStorageSafe.read_uint(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L256-L258) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L256-L258


 - [ ] ID-515
Constant [StdAssertions.vm](node_modules/forge-std/src/StdAssertions.sol#L8) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdAssertions.sol#L8


 - [ ] ID-516
Parameter [stdStorage.target(StdStorage,address)._target](node_modules/forge-std/src/StdStorage.sol#L377) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L377


 - [ ] ID-517
Function [stdStorageSafe.read_int(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L261-L263) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L261-L263


 - [ ] ID-518
Parameter [stdStorageSafe.sig(StdStorage,bytes4)._sig](node_modules/forge-std/src/StdStorage.sol#L181) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L181


 - [ ] ID-519
Event [StdAssertions.log_named_decimal_uint(string,uint256,uint256)](node_modules/forge-std/src/StdAssertions.sol#L23) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L23


 - [ ] ID-520
Parameter [stdStorage.find(StdStorage,bool)._clear](node_modules/forge-std/src/StdStorage.sol#L372) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L372


 - [ ] ID-521
Function [stdStorage.checked_write(StdStorage,bytes32)](node_modules/forge-std/src/StdStorage.sol#L451-L485) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L451-L485


 - [ ] ID-522
Parameter [MarketTest.createMarket(string,uint256,uint256,uint256,uint256,uint256,uint256,Share,Share).LLTV](contracts/markets.t.sol#L30) is not in mixedCase

contracts/markets.t.sol#L30


 - [ ] ID-523
Parameter [stdStorage.sig(StdStorage,bytes4)._sig](node_modules/forge-std/src/StdStorage.sol#L382) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L382


 - [ ] ID-524
Event [StdAssertions.log_named_bytes32(string,bytes32)](node_modules/forge-std/src/StdAssertions.sol#L21) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L21


 - [ ] ID-525
Function [stdStorage.enable_packed_slots(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L412-L414) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L412-L414


 - [ ] ID-526
Function [ERC4626Upgradeable.__ERC4626_init(IERC20)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L114-L116) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L114-L116


 - [ ] ID-527
Constant [stdJson.vm](node_modules/forge-std/src/StdJson.sol#L27) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdJson.sol#L27


 - [ ] ID-528
Event [StdAssertions.log_array(address[])](node_modules/forge-std/src/StdAssertions.sol#L31) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L31


 - [ ] ID-529
Parameter [stdStorage.with_calldata(StdStorage,bytes)._calldata](node_modules/forge-std/src/StdStorage.sol#L407) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L407


 - [ ] ID-530
Function [ERC4626Upgradeable.__ERC4626_init_unchained(IERC20)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L118-L123) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L118-L123


 - [ ] ID-531
Event [StdAssertions.log_bytes(bytes)](node_modules/forge-std/src/StdAssertions.sol#L17) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L17


 - [ ] ID-532
Function [StdUtils._console2_log_StdUtils(string,string)](node_modules/forge-std/src/StdUtils.sol#L244-L246) is not in mixedCase

node_modules/forge-std/src/StdUtils.sol#L244-L246


 - [ ] ID-533
Constant [StdCheatsSafe.vm](node_modules/forge-std/src/StdCheats.sol#L9) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdCheats.sol#L9


 - [ ] ID-534
Function [stdStorage.checked_write(StdStorage,bool)](node_modules/forge-std/src/StdStorage.sol#L442-L448) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L442-L448


 - [ ] ID-535
Parameter [stdStorageSafe.with_calldata(StdStorage,bytes)._calldata](node_modules/forge-std/src/StdStorage.sol#L193) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L193


 - [ ] ID-536
Function [stdStorageSafe.with_calldata(StdStorage,bytes)](node_modules/forge-std/src/StdStorage.sol#L193-L196) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L193-L196


 - [ ] ID-537
Constant [ERC4626Upgradeable.ERC4626StorageLocation](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L83) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol#L83


 - [ ] ID-538
Function [stdStorageSafe.read_bytes32(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L237-L239) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L237-L239


 - [ ] ID-539
Variable [Market.LLTV](contracts/markets.sol#L13) is not in mixedCase

contracts/markets.sol#L13


 - [ ] ID-540
Function [stdStorage.with_key(StdStorage,bytes32)](node_modules/forge-std/src/StdStorage.sol#L402-L404) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L402-L404


 - [ ] ID-541
Function [stdStorage.read_uint(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L503-L505) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L503-L505


 - [ ] ID-542
Constant [StdCheats.vm](node_modules/forge-std/src/StdCheats.sol#L672) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdCheats.sol#L672


 - [ ] ID-543
Function [stdStorageSafe.read_address(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L251-L253) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L251-L253


 - [ ] ID-544
Parameter [stdStorage.depth(StdStorage,uint256)._depth](node_modules/forge-std/src/StdStorage.sol#L417) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L417


 - [ ] ID-545
Function [MarketTest.test_usersHaveBorrowBalance()](contracts/markets.t.sol#L82-L86) is not in mixedCase

contracts/markets.t.sol#L82-L86


 - [ ] ID-546
Event [StdAssertions.log_array(uint256[])](node_modules/forge-std/src/StdAssertions.sol#L29) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L29


 - [ ] ID-547
Event [StdAssertions.log_uint(uint256)](node_modules/forge-std/src/StdAssertions.sol#L16) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L16


 - [ ] ID-548
Contract [stdToml](node_modules/forge-std/src/StdToml.sol#L23-L323) is not in CapWords

node_modules/forge-std/src/StdToml.sol#L23-L323


 - [ ] ID-549
Event [StdAssertions.log_named_bytes(string,bytes)](node_modules/forge-std/src/StdAssertions.sol#L26) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L26


 - [ ] ID-550
Event [stdStorageSafe.WARNING_UninitedSlot(address,uint256)](node_modules/forge-std/src/StdStorage.sol#L26) is not in CapWords

node_modules/forge-std/src/StdStorage.sol#L26


 - [ ] ID-551
Contract [console](node_modules/forge-std/src/console.sol#L4-L1599) is not in CapWords

node_modules/forge-std/src/console.sol#L4-L1599


 - [ ] ID-552
Event [StdAssertions.log_bytes32(bytes32)](node_modules/forge-std/src/StdAssertions.sol#L14) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L14


 - [ ] ID-553
Function [stdStorage.read_int(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L508-L510) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L508-L510


 - [ ] ID-554
Function [MarketTest.test_supplyWithBorrow_noRevert()](contracts/markets.t.sol#L259-L294) is not in mixedCase

contracts/markets.t.sol#L259-L294


 - [ ] ID-555
Constant [StdChains.vm](node_modules/forge-std/src/StdChains.sol#L35) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdChains.sol#L35


 - [ ] ID-556
Constant [stdToml.vm](node_modules/forge-std/src/StdToml.sol#L24) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdToml.sol#L24


 - [ ] ID-557
Event [StdAssertions.log(string)](node_modules/forge-std/src/StdAssertions.sol#L10) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L10


 - [ ] ID-558
Function [stdStorage.checked_write(StdStorage,address)](node_modules/forge-std/src/StdStorage.sol#L427-L429) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L427-L429


 - [ ] ID-559
Function [stdStorage.read_bool(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L493-L495) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L493-L495


 - [ ] ID-560
Function [ERC20Upgradeable.__ERC20_init_unchained(string,string)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L61-L65) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L61-L65


 - [ ] ID-561
Contract [stdStorage](node_modules/forge-std/src/StdStorage.sol#L358-L521) is not in CapWords

node_modules/forge-std/src/StdStorage.sol#L358-L521


 - [ ] ID-562
Contract [stdJson](node_modules/forge-std/src/StdJson.sol#L26-L327) is not in CapWords

node_modules/forge-std/src/StdJson.sol#L26-L327


 - [ ] ID-563
Function [MarketTest.test_marketsGetNotEqShares()](contracts/markets.t.sol#L108-L137) is not in mixedCase

contracts/markets.t.sol#L108-L137


 - [ ] ID-564
Constant [stdStorageSafe.vm](node_modules/forge-std/src/StdStorage.sol#L28) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdStorage.sol#L28


 - [ ] ID-565
Function [ERC20Upgradeable.__ERC20_init(string,string)](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L57-L59) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L57-L59


 - [ ] ID-566
Function [StdUtils._console2_log_StdUtils(string,uint256)](node_modules/forge-std/src/StdUtils.sol#L240-L242) is not in mixedCase

node_modules/forge-std/src/StdUtils.sol#L240-L242


 - [ ] ID-567
Constant [StdStyle.vm](node_modules/forge-std/src/StdStyle.sol#L7) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdStyle.sol#L7


 - [ ] ID-568
Function [ContextUpgradeable.__Context_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L21-L22) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L21-L22


 - [ ] ID-569
Function [MarketTest.test_sharesInMarketsHaveCorrectAssets()](contracts/markets.t.sol#L92-L106) is not in mixedCase

contracts/markets.t.sol#L92-L106


 - [ ] ID-570
Constant [stdStorage.vm](node_modules/forge-std/src/StdStorage.sol#L359) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdStorage.sol#L359


 - [ ] ID-571
Constant [ScriptBase.vmSafe](node_modules/forge-std/src/Base.sol#L47) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/Base.sol#L47


 - [ ] ID-572
Function [stdStorage.with_key(StdStorage,address)](node_modules/forge-std/src/StdStorage.sol#L392-L394) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L392-L394


 - [ ] ID-573
Function [stdStorage.checked_write(StdStorage,uint256)](node_modules/forge-std/src/StdStorage.sol#L432-L434) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L432-L434


 - [ ] ID-574
Contract [stdStorageSafe](node_modules/forge-std/src/StdStorage.sol#L24-L356) is not in CapWords

node_modules/forge-std/src/StdStorage.sol#L24-L356


 - [ ] ID-575
Function [MarketTest.test_marketsHaveBorrowBalance()](contracts/markets.t.sol#L70-L74) is not in mixedCase

contracts/markets.t.sol#L70-L74


 - [ ] ID-576
Function [stdStorageSafe.with_key(StdStorage,address)](node_modules/forge-std/src/StdStorage.sol#L199-L202) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L199-L202


 - [ ] ID-577
Contract [stdMath](node_modules/forge-std/src/StdMath.sol#L5-L68) is not in CapWords

node_modules/forge-std/src/StdMath.sol#L5-L68


 - [ ] ID-578
Event [StdAssertions.log_named_int(string,int256)](node_modules/forge-std/src/StdAssertions.sol#L24) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L24


 - [ ] ID-579
Contract [stdError](node_modules/forge-std/src/StdError.sol#L6-L33) is not in CapWords

node_modules/forge-std/src/StdError.sol#L6-L33


 - [ ] ID-580
Event [StdAssertions.logs(bytes)](node_modules/forge-std/src/StdAssertions.sol#L11) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L11


 - [ ] ID-581
Variable [Test.IS_TEST](node_modules/forge-std/src/Test.sol#L31) is not in mixedCase

node_modules/forge-std/src/Test.sol#L31


 - [ ] ID-582
Function [stdStorage.with_calldata(StdStorage,bytes)](node_modules/forge-std/src/StdStorage.sol#L407-L409) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L407-L409


 - [ ] ID-583
Parameter [stdStorageSafe.depth(StdStorage,uint256)._depth](node_modules/forge-std/src/StdStorage.sol#L223) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L223


 - [ ] ID-584
Parameter [stdStorageSafe.find(StdStorage,bool)._clear](node_modules/forge-std/src/StdStorage.sol#L108) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L108


 - [ ] ID-585
Function [stdStorage.read_address(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L498-L500) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L498-L500


 - [ ] ID-586
Variable [Vault.APY](contracts/vaults.sol#L8) is not in mixedCase

contracts/vaults.sol#L8


 - [ ] ID-587
Event [StdAssertions.log_address(address)](node_modules/forge-std/src/StdAssertions.sol#L13) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L13


 - [ ] ID-588
Event [StdAssertions.log_int(int256)](node_modules/forge-std/src/StdAssertions.sol#L15) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L15


 - [ ] ID-589
Function [VmSafe.eth_getLogs(uint256,uint256,address,bytes32[])](node_modules/forge-std/src/Vm.sol#L666-L669) is not in mixedCase

node_modules/forge-std/src/Vm.sol#L666-L669


 - [ ] ID-590
Parameter [stdStorageSafe.target(StdStorage,address)._target](node_modules/forge-std/src/StdStorage.sol#L175) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L175


 - [ ] ID-591
Contract [safeconsole](node_modules/forge-std/src/safeconsole.sol#L6-L13248) is not in CapWords

node_modules/forge-std/src/safeconsole.sol#L6-L13248


 - [ ] ID-592
Constant [StdUtils.vm](node_modules/forge-std/src/StdUtils.sol#L13) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/StdUtils.sol#L13


 - [ ] ID-593
Event [StdAssertions.log_array(int256[])](node_modules/forge-std/src/StdAssertions.sol#L30) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L30


 - [ ] ID-594
Function [stdStorageSafe.with_key(StdStorage,uint256)](node_modules/forge-std/src/StdStorage.sol#L205-L208) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L205-L208


 - [ ] ID-595
Event [StdAssertions.log_named_array(string,int256[])](node_modules/forge-std/src/StdAssertions.sol#L33) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L33


 - [ ] ID-596
Parameter [stdStorageSafe.sig(StdStorage,string)._sig](node_modules/forge-std/src/StdStorage.sol#L187) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L187


 - [ ] ID-597
Function [MarketTest.test_usersDontHaveAnyShares()](contracts/markets.t.sol#L175-L209) is not in mixedCase

contracts/markets.t.sol#L175-L209


 - [ ] ID-598
Constant [ERC20Upgradeable.ERC20StorageLocation](node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L44) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol#L44


 - [ ] ID-599
Function [stdStorageSafe.read_bool(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L243-L248) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L243-L248


 - [ ] ID-600
Event [StdAssertions.log_named_string(string,string)](node_modules/forge-std/src/StdAssertions.sol#L27) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L27


 - [ ] ID-601
Parameter [Market.init(string,uint256,address,uint256,uint256,uint256,uint256,uint256,Share,Share).LLTV_](contracts/markets.sol#L37) is not in mixedCase

contracts/markets.sol#L37


 - [ ] ID-602
Function [stdStorage.checked_write_int(StdStorage,int256)](node_modules/forge-std/src/StdStorage.sol#L437-L439) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L437-L439


 - [ ] ID-603
Function [StdCheats._console2_log_StdCheats(string)](node_modules/forge-std/src/StdCheats.sol#L918-L921) is not in mixedCase

node_modules/forge-std/src/StdCheats.sol#L918-L921


 - [ ] ID-604
Variable [MyProxy.LLTV](contracts/proxy.sol#L12) is not in mixedCase

contracts/proxy.sol#L12


 - [ ] ID-605
Function [stdStorageSafe.with_key(StdStorage,bytes32)](node_modules/forge-std/src/StdStorage.sol#L211-L214) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L211-L214


 - [ ] ID-606
Constant [CommonBase.vm](node_modules/forge-std/src/Base.sol#L40) is not in UPPER_CASE_WITH_UNDERSCORES

node_modules/forge-std/src/Base.sol#L40


 - [ ] ID-607
Parameter [Market.init(string,uint256,address,uint256,uint256,uint256,uint256,uint256,Share,Share).InterestRate_](contracts/markets.sol#L38) is not in mixedCase

contracts/markets.sol#L38


 - [ ] ID-608
Event [StdAssertions.log_named_address(string,address)](node_modules/forge-std/src/StdAssertions.sol#L20) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L20


 - [ ] ID-609
Event [StdAssertions.log_named_decimal_int(string,int256,uint256)](node_modules/forge-std/src/StdAssertions.sol#L22) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L22


 - [ ] ID-610
Event [StdAssertions.log_string(string)](node_modules/forge-std/src/StdAssertions.sol#L18) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L18


 - [ ] ID-611
Function [MarketTest.test_usersHaveCollateralBalance()](contracts/markets.t.sol#L76-L80) is not in mixedCase

contracts/markets.t.sol#L76-L80


 - [ ] ID-612
Variable [Market.InterestRate](contracts/markets.sol#L17) is not in mixedCase

contracts/markets.sol#L17


 - [ ] ID-613
Function [ContextUpgradeable.__Context_init()](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L18-L19) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L18-L19


 - [ ] ID-614
Function [MarketTest.test_supplyWithoutBorrow()](contracts/markets.t.sol#L226-L255) is not in mixedCase

contracts/markets.t.sol#L226-L255


 - [ ] ID-615
Variable [MyProxy.InterestRate](contracts/proxy.sol#L16) is not in mixedCase

contracts/proxy.sol#L16


 - [ ] ID-616
Function [Market.LTV(address)](contracts/markets.sol#L90-L95) is not in mixedCase

contracts/markets.sol#L90-L95


 - [ ] ID-617
Function [stdStorage.with_key(StdStorage,uint256)](node_modules/forge-std/src/StdStorage.sol#L397-L399) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L397-L399


 - [ ] ID-618
Function [stdStorage.read_bytes32(StdStorage)](node_modules/forge-std/src/StdStorage.sol#L488-L490) is not in mixedCase

node_modules/forge-std/src/StdStorage.sol#L488-L490


 - [ ] ID-619
Event [StdAssertions.log_named_array(string,address[])](node_modules/forge-std/src/StdAssertions.sol#L34) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L34


 - [ ] ID-620
Event [StdAssertions.log_named_array(string,uint256[])](node_modules/forge-std/src/StdAssertions.sol#L32) is not in CapWords

node_modules/forge-std/src/StdAssertions.sol#L32


 - [ ] ID-621
Function [MarketTest.test_marketsDontHaveAnyShares()](contracts/markets.t.sol#L139-L173) is not in mixedCase

contracts/markets.t.sol#L139-L173


## redundant-statements
Impact: Informational
Confidence: High
 - [ ] ID-622
Redundant expression "[status](node_modules/forge-std/src/StdCheats.sol#L920)" in[StdCheats](node_modules/forge-std/src/StdCheats.sol#L668-L922)

node_modules/forge-std/src/StdCheats.sol#L920


## too-many-digits
Impact: Informational
Confidence: Medium
 - [ ] ID-623
[Math.log2(uint256)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L619-L658) uses literals with too many digits:
	- [r = r | byte(uint256,uint256)(x >> r,0x0000010102020202030303030303030300000000000000000000000000000000)](node_modules/@openzeppelin/contracts/utils/math/Math.sol#L656)

node_modules/@openzeppelin/contracts/utils/math/Math.sol#L619-L658


 - [ ] ID-624
[safeconsole.slitherConstructorConstantVariables()](node_modules/forge-std/src/safeconsole.sol#L6-L13248) uses literals with too many digits:
	- [CONSOLE_ADDR = 0x000000000000000000000000000000000000000000636F6e736F6c652e6c6f67](node_modules/forge-std/src/safeconsole.sol#L7)

node_modules/forge-std/src/safeconsole.sol#L6-L13248


## unimplemented-functions
Impact: Informational
Confidence: High
 - [ ] ID-625
[MyProxy](contracts/proxy.sol#L7-L33) does not implement functions:
	- [Proxy._implementation()](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L51)

contracts/proxy.sol#L7-L33


## unindexed-event-address
Impact: Informational
Confidence: High
 - [ ] ID-626
Event [StdAssertions.log_address(address)](node_modules/forge-std/src/StdAssertions.sol#L13) has address parameters but no indexed parameters

node_modules/forge-std/src/StdAssertions.sol#L13


 - [ ] ID-627
Event [stdStorageSafe.SlotFound(address,bytes4,bytes32,uint256)](node_modules/forge-std/src/StdStorage.sol#L25) has address parameters but no indexed parameters

node_modules/forge-std/src/StdStorage.sol#L25


 - [ ] ID-628
Event [stdStorageSafe.WARNING_UninitedSlot(address,uint256)](node_modules/forge-std/src/StdStorage.sol#L26) has address parameters but no indexed parameters

node_modules/forge-std/src/StdStorage.sol#L26


 - [ ] ID-629
Event [IERC1967.AdminChanged(address,address)](node_modules/@openzeppelin/contracts/interfaces/IERC1967.sol#L18) has address parameters but no indexed parameters

node_modules/@openzeppelin/contracts/interfaces/IERC1967.sol#L18


 - [ ] ID-630
Event [StdAssertions.log_named_address(string,address)](node_modules/forge-std/src/StdAssertions.sol#L20) has address parameters but no indexed parameters

node_modules/forge-std/src/StdAssertions.sol#L20


## unused-state
Impact: Informational
Confidence: High
 - [ ] ID-631
[CommonBase.DEFAULT_SENDER](node_modules/forge-std/src/Base.sol#L22) is never used in [MarketTest](contracts/markets.t.sol#L10-L299)

node_modules/forge-std/src/Base.sol#L22


 - [ ] ID-632
[MyProxy.borrowShare](contracts/proxy.sol#L25) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L25


 - [ ] ID-633
[MyProxy.collateralShare](contracts/proxy.sol#L24) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L24


 - [ ] ID-634
[MyProxy.vault](contracts/proxy.sol#L17) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L17


 - [ ] ID-635
[MyProxy.version](contracts/proxy.sol#L10) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L10


 - [ ] ID-636
[CommonBase.stdstore](node_modules/forge-std/src/Base.sol#L41) is never used in [MarketTest](contracts/markets.t.sol#L10-L299)

node_modules/forge-std/src/Base.sol#L41


 - [ ] ID-637
[MyProxy.currentBorrowIndex](contracts/proxy.sol#L15) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L15


 - [ ] ID-638
[CommonBase.CREATE2_FACTORY](node_modules/forge-std/src/Base.sol#L18) is never used in [MarketTest](contracts/markets.t.sol#L10-L299)

node_modules/forge-std/src/Base.sol#L18


 - [ ] ID-639
[MyProxy.collateralToken](contracts/proxy.sol#L22) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L22


 - [ ] ID-640
[CommonBase.MULTICALL3_ADDRESS](node_modules/forge-std/src/Base.sol#L31) is never used in [MarketTest](contracts/markets.t.sol#L10-L299)

node_modules/forge-std/src/Base.sol#L31


 - [ ] ID-641
[MyProxy.blocksPerYear](contracts/proxy.sol#L13) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L13


 - [ ] ID-642
[MyProxy.liquidationCoefficient](contracts/proxy.sol#L19) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L19


 - [ ] ID-643
[MyProxy.adminFee](contracts/proxy.sol#L18) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L18


 - [ ] ID-644
[CommonBase.DEFAULT_TEST_CONTRACT](node_modules/forge-std/src/Base.sol#L27) is never used in [MarketTest](contracts/markets.t.sol#L10-L299)

node_modules/forge-std/src/Base.sol#L27


 - [ ] ID-645
[MyProxy.borrowToken](contracts/proxy.sol#L23) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L23


 - [ ] ID-646
[MyProxy.InterestRate](contracts/proxy.sol#L16) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L16


 - [ ] ID-647
[MyProxy.title](contracts/proxy.sol#L11) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L11


 - [ ] ID-648
[MyProxy.borrowPrice](contracts/proxy.sol#L20) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L20


 - [ ] ID-649
[MyProxy.lastAccureBlock](contracts/proxy.sol#L14) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L14


 - [ ] ID-650
[CommonBase.SECP256K1_ORDER](node_modules/forge-std/src/Base.sol#L34-L35) is never used in [MarketTest](contracts/markets.t.sol#L10-L299)

node_modules/forge-std/src/Base.sol#L34-L35


 - [ ] ID-651
[MyProxy.collateralPrice](contracts/proxy.sol#L21) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L21


 - [ ] ID-652
[CommonBase.CONSOLE](node_modules/forge-std/src/Base.sol#L14) is never used in [MarketTest](contracts/markets.t.sol#L10-L299)

node_modules/forge-std/src/Base.sol#L14


 - [ ] ID-653
[CommonBase.UINT256_MAX](node_modules/forge-std/src/Base.sol#L37-L38) is never used in [MarketTest](contracts/markets.t.sol#L10-L299)

node_modules/forge-std/src/Base.sol#L37-L38


 - [ ] ID-654
[MyProxy.LLTV](contracts/proxy.sol#L12) is never used in [MyProxy](contracts/proxy.sol#L7-L33)

contracts/proxy.sol#L12


## constable-states
Impact: Optimization
Confidence: High
 - [ ] ID-655
[MyProxy.title](contracts/proxy.sol#L11) should be constant 

contracts/proxy.sol#L11


 - [ ] ID-656
[Test.IS_TEST](node_modules/forge-std/src/Test.sol#L31) should be constant 

node_modules/forge-std/src/Test.sol#L31


 - [ ] ID-657
[MyProxy.collateralPrice](contracts/proxy.sol#L21) should be constant 

contracts/proxy.sol#L21


 - [ ] ID-658
[MyProxy.version](contracts/proxy.sol#L10) should be constant 

contracts/proxy.sol#L10


 - [ ] ID-659
[MyProxy.blocksPerYear](contracts/proxy.sol#L13) should be constant 

contracts/proxy.sol#L13


 - [ ] ID-660
[MyProxy.collateralShare](contracts/proxy.sol#L24) should be constant 

contracts/proxy.sol#L24


 - [ ] ID-661
[MyProxy.currentBorrowIndex](contracts/proxy.sol#L15) should be constant 

contracts/proxy.sol#L15


 - [ ] ID-662
[MyProxy.InterestRate](contracts/proxy.sol#L16) should be constant 

contracts/proxy.sol#L16


 - [ ] ID-663
[MyProxy.collateralToken](contracts/proxy.sol#L22) should be constant 

contracts/proxy.sol#L22


 - [ ] ID-664
[MyProxy.borrowToken](contracts/proxy.sol#L23) should be constant 

contracts/proxy.sol#L23


 - [ ] ID-665
[MyProxy.vault](contracts/proxy.sol#L17) should be constant 

contracts/proxy.sol#L17


 - [ ] ID-666
[MyProxy.borrowPrice](contracts/proxy.sol#L20) should be constant 

contracts/proxy.sol#L20


 - [ ] ID-667
[MyProxy.LLTV](contracts/proxy.sol#L12) should be constant 

contracts/proxy.sol#L12


 - [ ] ID-668
[MyProxy.adminFee](contracts/proxy.sol#L18) should be constant 

contracts/proxy.sol#L18


 - [ ] ID-669
[MyProxy.borrowShare](contracts/proxy.sol#L25) should be constant 

contracts/proxy.sol#L25


 - [ ] ID-670
[MyProxy.liquidationCoefficient](contracts/proxy.sol#L19) should be constant 

contracts/proxy.sol#L19


 - [ ] ID-671
[MyProxy.lastAccureBlock](contracts/proxy.sol#L14) should be constant 

contracts/proxy.sol#L14


## immutable-states
Impact: Optimization
Confidence: High
 - [ ] ID-672
[Vault.assetToken](contracts/vaults.sol#L7) should be immutable 

contracts/vaults.sol#L7


 - [ ] ID-673
[Vault.APY](contracts/vaults.sol#L8) should be immutable 

contracts/vaults.sol#L8


