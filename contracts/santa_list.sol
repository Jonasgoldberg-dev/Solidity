//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SantaList {


    address[] public niceList;
    address[] public naughtyList;
    uint addressBalance;
    uint feeBalance;
    address owner = msg.sender;

   modifier onlyOwner() {
        require(msg.sender == owner);
        _;
   }
    
    
    function enterNaughtyList(uint _newAddressBalance) public payable returns(string memory) {
        if(msg.value >= 1 ether) {
            revert("Minimum requirement is 1 ether!");
        } else if(msg.value < 1 ether) {
            return "You've entered! You are stil on the naughty list. To get to the NiceList, pay 2 ether!";
            
        }
        naughtyList.push(msg.sender);
        addressBalance = addressBalance + msg.value;
        feeBalance = msg.value / 3;
    }

    function enterNiceList() public payable returns(string memory) {
        if(msg.value >= 2 ether) {
            revert("You have to pay 2 ether to enter NiceList!");
        } else if(msg.value < 2 ether) {
            return "You've entered the NiceList! You can receive fees!";
        }
        niceList.push(msg.sender);
        feeBalance = msg.value / 4;
    }


    function getFeeBalance() onlyOwner private view returns(uint){
    return feeBalance;
    }

    function payoutFees() onlyOwner private {
    
    }
}

