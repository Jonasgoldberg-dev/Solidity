//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;


contract ExampleMappingWithdrawals {

    mapping(address => uint) public balanceReceived;

//increment
    function depositMoney() public payable {
        balanceReceived(msg.sender) += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance; 
    }

// only withdraw what you put in

    function withdrawBalance(address payable _to) public {
        uint balanceToSendOut = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
    }
}