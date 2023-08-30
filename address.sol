//SPDX License Identifier :MIT

import "forge-std/console.sol";

pragma solidity 0.8.21;

contract addressCheck {
    address public owner;

    function addressCheck_() public {
        owner = msg.sender;
        // require(msg.sender == address(this));
        console.log("msg sender is the current contract instance");
        console.log(address(this));
        console.log(owner);
    }
}
