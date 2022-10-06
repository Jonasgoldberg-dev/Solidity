//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleWrapAround {
    uint public myUint;

    uint8 public myUint8 = 2**4;

//set myuint
    function setMyUint (uint _myUint) public {
        myUint = _myUint;
    }

//unchecked makes it possible to do decrement below 0 with Uint
    function decrementUint() public {
        unchecked {
            myUint --;   
        }
    }

//increment
    function incrementUint8() public {
        myUint8++;
    }



}

/* SafeMath
To make sure subtraction doesn’t error when Uint goes below 0
