//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract MyContract {

    string public ourString = "hello world!";

    function updateOurString(string memory _updateString) public {
        ourString = _updateString;
    }



}

/* Structure:
Contract
Variables
Constructor - initial state, public, private, internal, external
Functions - Function 1 - Function 2 - Function 3
Functions: 
Read - free
Write - gas

Modifier: 
Public, internal, private, external
view, return(something like uint)

Free function
In contract set public = free function 
Example: uint public count = 0;
