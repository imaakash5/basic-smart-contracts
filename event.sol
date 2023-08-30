//SPDX-License-Identifier : MIT

pragma solidity 0.8.21;

contract Event {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function transfer(address from, address to, uint256 amount) public {
        emit Transfer(to, from, amount);
    }

    function ManyTransfer(address from, address[] calldata to, uint256[] calldata amount) public {
        for (uint256 i = 0; i < to.length; i++) {
            emit Transfer(from, to[i], amount[i]);
        }
    }
}
