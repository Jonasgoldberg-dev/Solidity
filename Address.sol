//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleAddress {
//default address = 0
    address public someAddress;

//Set address
    function setSomeAddress (address _someAddress) public {
        someAddress = _someAddress;
    }

//Get address balance. Display 
    function getAddressBalance() public view returns(uint) {
        return someAddress.balance;
    }

}