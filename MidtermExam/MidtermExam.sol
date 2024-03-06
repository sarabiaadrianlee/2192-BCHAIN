// Midterm Exam 
// Sarabia, Adrian Lee S | WD - 401

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GradeContract {
    struct Student {
        string name;
        uint256 prelimGrade;
        uint256 midtermGrade;
        uint256 finalGrade;
        GradeStatus status;
    }

    
    enum GradeStatus {Fail, Pass}

    // Mapping to store students' data
    mapping(address => Student) public students;

    // Owner of the contract
    address public owner;

    //ensure only owner can execute certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    //validate grade range
    modifier validGrade(uint256 grade) {
        require(grade >= 0 && grade <= 100, "Grade must be between 0 and 100");
        _;
    }

    // Event emitted upon grade calculation
    event GradeComputed(string studentName, GradeStatus status);

    // Constructor sets the owner
    constructor() {
        owner = msg.sender;
    }

    //set student's name
    function setName(string calldata _name) external {
        students[msg.sender].name = _name;
    }

    //set grades
    function setPrelimGrade(uint256 _grade) external onlyOwner validGrade(_grade) {
        students[msg.sender].prelimGrade = _grade;
    }

    function setMidtermGrade(uint256 _grade) external onlyOwner validGrade(_grade) {
        students[msg.sender].midtermGrade = _grade;
    }

    function setFinalGrade(uint256 _grade) external onlyOwner validGrade(_grade) {
        students[msg.sender].finalGrade = _grade;
    }

    // Function to calculate grade
    function calculateGrade() external onlyOwner {
        Student storage student = students[msg.sender];
        uint256 overallGrade = (student.prelimGrade + student.midtermGrade + student.finalGrade) / 3;

        if (overallGrade > 74) {
            student.status = GradeStatus.Pass;
        } else {
            student.status = GradeStatus.Fail;
        }

        emit GradeComputed(student.name, student.status);
    }
}
