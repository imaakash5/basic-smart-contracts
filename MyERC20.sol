// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
//add ownable

contract MyERC20 is ERC20, Ownable {
    constructor() ERC20("AAKASH", "$AKSH") {}

    //add only owner to both mint and burn
    function mint(address addr, uint256 amount) public onlyOwner {
        _mint(addr, amount);
    }

    function burn(address addr, uint256 amount) public onlyOwner {
        _burn(addr, amount);
    }

    // address public admin = vm.addr(1);
    // vm.startPrank(admin);
    // mint(admin,3);
    // vm.stopPrank();
}
