pragma solidity ^0.5.0;

contract BorrowLend {
    // The address of the lender
    address public lender;
    
    // The address of the borrower
    address public borrower;
    
    // The amount of money being borrowed
    uint public loanAmount;
    
    // The interest rate for the loan
    uint public interestRate;
    
    // The date the loan is due
    uint public loanDueDate;
    
    // Whether the loan has been repaid
    bool public loanRepaid;
    
    // Event for when the loan is repaid
    event LoanRepaid(address borrower, uint loanAmount);
    
    // Constructor function
    constructor(address _lender, address _borrower, uint _loanAmount, uint _interestRate, uint _loanDueDate) public {
        lender = _lender;
        borrower = _borrower;
        loanAmount = _loanAmount;
        interestRate = _interestRate;
        loanDueDate = _loanDueDate;
        loanRepaid = false;
    }
    
    // Function for the borrower to repay the loan
    function repayLoan() public {
        require(msg.sender == borrower, "Only the borrower can repay the loan");
        require(!loanRepaid, "Loan has already been repaid");
        
        // Calculate the total amount to be repaid, including interest
        uint totalAmount = loanAmount + (loanAmount * interestRate / 100);
        
        // Transfer the total amount to the lender
        lender.transfer(totalAmount);
        
        // Set the loanRepaid flag to true
        loanRepaid = true;
        
        // Emit the LoanRepaid event
        emit LoanRepaid(borrower, loanAmount);
    }
    
    // Function to check the status of the loan
    function checkLoanStatus() public view returns (bool) {
        return loanRepaid;
    }
}
