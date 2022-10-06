//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleRequide {


// set uint8
    mapping (address => uint8) public balanceReceived;


//assert stopping the execution. All gas is gone. Smart contract should never reach this state. Last resort. 
    function receiveMoney() public payable {
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8 (msg.value);

    }


    function withdrawMoney(address payable _to, uint8 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds, aborting!"); 
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
    }
}