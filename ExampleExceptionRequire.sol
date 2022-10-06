//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleRequide {

    mapping (address => uint) public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;

    }


//require that money withdrawn is less than money deployed
//require returns used gas 

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds, aborting!"); 
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
    }
}