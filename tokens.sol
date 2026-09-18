// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{
    uint8 immutable _decimals;

    constructor(string memory name, string memory symbol, uint8 decimals_) ERC20(name, symbol){
        _decimals = decimals_;
    }

    function decimals() public view override returns(uint8){
        return _decimals;
    }

    function mint(address account, uint amount) public {
        super._mint(account, amount);
    }

    function burn(address account, uint amount) public {
        super._burn(account, amount);
    }

    function transfer(address from, address to, uint amount) public{
        super._transfer(from, to, amount);
    }
}

contract USDC is Token{
    constructor() Token("USDC", "USDC", 18){}
}

contract PryUSD is Token{
    constructor() Token("PryUSD", "PryUSD", 18){}
}

contract USD1 is Token{
    constructor() Token("USD1", "USD1", 18){}
}

contract USD is Token{
    constructor() Token("USD", "USD", 18){}
}

contract USDT is Token{
    constructor() Token("USDT", "USDT", 18){}
}

contract UCDC is Token{
    constructor() Token("UCDC", "UCDC", 18){}
}

contract DAI is Token{
    constructor() Token("DAI", "DAI", 18){}
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";

contract Share is ERC4626{
    uint8 immutable _decimals;

    constructor(address asset, string memory name, string memory symbol, uint8 decimals_) ERC4626(IERC20(asset)) ERC20(name, symbol){
        _decimals = decimals_;
    }

    function decimals() public view override returns(uint8){
        return _decimals;
    }

    function burn(address account, uint amount) public {
        super._burn(account, amount);
    }

    function mint(address account, uint amount) public {
        super._mint(account, amount);
    }
}