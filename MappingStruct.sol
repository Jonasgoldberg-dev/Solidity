//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract MappingStructExample {


    struct Transaction {
        uint amount;
        uint timestamp;

    }

    struct Balance {
        uint totalBalance;
        uint numberOfDeposits;
        mapping(uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;

    }

    mapping(address => balance) balances;


    function depositMoney() public payable {
        balance[msg.sender].totalBalance += msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposits;
        balance[msg.sender].numDeposits++;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        balance[msg.sender].totalBalance -= _amount;

        Transaction memory withdraw = Transaction (_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawals;
        balance[msg.sender].numWithdrawals++;

        _to.transfer(_amount);
        
    }

}