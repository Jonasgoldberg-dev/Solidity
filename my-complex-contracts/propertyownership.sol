/* Here is an example of a simple smart contract for partial property ownership. This contract allows multiple parties to jointly own a property, 
with each party owning a specified percentage of the property. 
The contract also includes functions for transferring ownership shares and updating the property's value. */

pragma solidity ^0.4.0;


contract PropertyOwnership {

    // Define the struct for representing an owner
    struct Owner {
        address addr;
        uint percentage;
    }

    // Define the variables for the contract
    uint public propertyValue;
    Owner[] public owners;

    // Constructor function that is called when the contract is created
    function PropertyOwnership(uint _propertyValue) public {
        propertyValue = _propertyValue;
    }

    // Function that is called to add a new owner to the contract
    function addOwner(address _owner, uint _percentage) public {
        // Verify that the total ownership percentage does not exceed 100%
        uint totalPercentage = 0;
        for (uint i = 0; i < owners.length; i++) {
            totalPercentage += owners[i].percentage;
        }
        require(totalPercentage + _percentage <= 100);

        // Add the new owner to the contract
        owners.push(Owner(_owner, _percentage));
    }

    // Function that is called to transfer an ownership share from one owner to another
    function transferOwnership(address _from, address _to, uint _percentage) public {
        // Verify that the sender is the owner of the specified percentage of the property
        uint senderPercentage = 0;
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i].addr == _from) {
                senderPercentage = owners[i].percentage;
                break;
            }
        }
        require(senderPercentage >= _percentage);

        // Transfer the ownership share from the sender to the recipient
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i].addr == _from) {
                owners[i].percentage -= _percentage;
            }
            if (owners[i].addr == _to) {
                owners[i].percentage += _percentage;
            }
        }
    }

    // Function that is called to update the property's value
    function updateValue(uint _propertyValue) public {
        propertyValue = _propertyValue;
    }
}

/*To use this contract, the initial owner(s) of the property would create a new instance of the contract, specifying the property's initial value as the argument for the constructor function. They can then call the addOwner() function to add additional owners to the contract, specifying the address of the new owner and the percentage of the property that they own.

If an owner wishes to transfer a portion of their ownership share to another owner, they can call the transferOwnership() function, specifying the recipient's address and the percentage of the property that they wish to transfer.

The value of the property can be updated at any time by calling the updateValue() function and specifying the new property value. This can be used to reflect changes in the property's market value over time.


