// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackExample {
    event FallbackReceived (address sender, uint amount);
    // Event to log payment received
    event PaymentReceived(address payer, uint256 amount);
    // Fallback function
    fallback() external payable {
        emit FallbackReceived(msg.sender, msg.value);
    }
    // Function to receive Ether
    receive() external payable {
        emit PaymentReceived(msg.sender, msg.value);
    }
}

//This Solidity code showcases a contract called FallbackExample, demonstrating how Ethereum contracts can handle incoming Ether transactions. 
//It utilizes two functions, fallback() and receive(), each serving a distinct purpose in processing payments and logging details. 
//The inclusion of events like FallbackReceived and PaymentReceived enhances transparency, enabling the monitoring of transactions within the contract. 
//Overall, the code exhibits a structured approach to managing incoming Ether, promoting accountability and clarity in Ethereum smart contract development.