// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MQuizContract {
    address owner;
    uint256 public age;
    uint256 public hours_Worked;
    uint256 public hourly_Rate;
    uint256 public totalSalary;


   
    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY THE OWNER CAN CALL THIS FUNCTION");
        _;
    }

    modifier validRate(uint256 rate_2 ) {
        require(rate_2  > 0, "Zero (0) is NOT Accepted in Hourly Rate");
        _;
    }

    modifier countedHours(uint256 hours_2) {
        require(hours_2 > 0, "Zero (0) is NOT Accepted in Hours Worked");
        _;
    }
    constructor() {
        owner = msg.sender;
    }


    function setAge(uint256 age_2) external{
        age = age_2;
    }

    function setHrsWrk(uint256 hours_2) external onlyOwner countedHours(hours_2) {
        hours_Worked = hours_2;
    }

    function setRate(uint256 rate_2 ) external onlyOwner validRate(rate_2 ) {
        hourly_Rate = rate_2 ;
    }

    function calculateTotSal() external onlyOwner {
        require(hourly_Rate > 0 && hours_Worked > 0, "Either the Hourly rate or hours worked is ZERO");
        totalSalary = hourly_Rate * hours_Worked;
    }
}
