//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleUint {
    uint public myUint;

    uint8 public myUint8;

    int public myInt = -10;

//set myuint
    function setMyUint (uint _myUint) public {
        myUint = _myUint;
    }

    function decrementUint() public {
        myUint --;   
    }

//increment
    function incrementUint8() public {
        myUint8++;
    }

//increment
    function incrementmMyInt() public {
        myInt++;
    }



    }

    /* 
Uint / Uint
Uint can’t go minus, int can. 
Uint = Uint256
Uint size: 8, 16, 32 (uint8)
Uint increment function : myUint++;
Uint decrement function : myUint–
