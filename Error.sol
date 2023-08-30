//SPDX-License-Idetifier:MIT

pragma solidity 0.8.21;

contract Error {
    error NotAuthorized();

    function thrownError() external {
        require(false, "test case passed, error thrown");
    }

    function throwCustomMsg() external {
        revert NotAuthorized();
    }
}
