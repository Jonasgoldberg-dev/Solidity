//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleAddress {

//default address = 0
    address public someAddress;


//sets address to the sender/account.
    function updateSomeAddress() public {
        someAddress = msg.sender;
    }

}