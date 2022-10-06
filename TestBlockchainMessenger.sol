//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;


contract Messenger {

    string public InitialMessage = "this is the first message";

    address public owner;

    uint public changeCounter;

    constructor() {
        owner = msg.sender;

    }

    function setNewMessage(string memory _newMessage) public {
        if(msg.sender == owner) {
            InitialMessage = _newMessage;
            changeCounter++;
        }
    }

}