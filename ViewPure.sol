//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleViewPure {

    uint public myStorageVariable;

    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }


//pure function:

    function getAddition(uint a, uint b) public pure returns(uint) {
    return a+b;
}


// Writing something to the blockchain.
    function setMyStorageVariable(uint _newVar) public {
        myStorageVariable = _newVar;
    }

}



/* 
2 kinds of functions 
View & Pure. Both can only read..

view: Accessing state variables
pure: Not accessing state variables
