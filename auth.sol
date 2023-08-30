//SPDX License Idetifier : MIT

pragma solidity 0.8.21;

contract authAdd {
    function setOwner(address addr) public {
        require(msg.sender == addr, "caller is not the owner");
    }
}
