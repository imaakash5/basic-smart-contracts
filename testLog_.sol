//SPDX License Identifier:MIT

pragma solidity 0.8.21;

import "forge-std/console.sol";

contract testLog_ {
    function _testLog() public view {
        console.log("Log something here");
        uint8 x = 23;
        console.log(x);
    }
}
