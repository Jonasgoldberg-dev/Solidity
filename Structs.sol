//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

//Child contract
contract Wallet {
    PaymentReceived public payment;

    function payContract() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}

//structs
contract Wallet2 {

    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContract() public payable {
        from = msg.sender;
        amount = msg.value;
        //or payment = PaymentReceivedStruct(msg.sender, msg.value);
    }
}





/* structs are cheaper than child smart contracts. Also more readable.
Child smart contracts are used for arbitrary complexity. 