// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract EtherWallet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Only owner can withdraw");
        require(_amount <= address(this).balance, "Insufficient balance");
        owner.transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

//EtherWallet, serves as a digital wallet for managing Ether. It allows the owner to deposit and withdraw Ether securely. 
//The contract employs a constructor to initialize the owner's address upon deployment and a receive() function to accept incoming Ether transfers. 
//The withdraw() function enables the owner to withdraw funds while enforcing security measures such as ownership verification and checking for sufficient balance. 
//Additionally, the getBalance() function allows anyone to check the current balance of the wallet. 
