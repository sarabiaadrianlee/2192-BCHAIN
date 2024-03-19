// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SendEther {
    constructor() payable {}
    
    receive() external payable { }
    
    function sendViaTransfer(address payable _to) external payable { _to.transfer(100); }
    
    function sendViaSend(address payable _to) external payable { bool sent = _to.send(100); require(sent, "Sending failed.");
}
    function sendViaCall(address payable _to) external payable { (bool success, ) = _to.call{value:100}(""); require(success, "Call failed.");
}
}
contract ReceiveEther {
    event Log (uint amount, uint gas);
    receive() external payable {
    emit Log(msg.value, gasleft());
}
}
contract SelfDestruct {
    event Deposit (uint amount);
    event Withdraw(uint amount);
    address public owner = msg.sender;
    
    receive() external payable {
        emit Deposit(msg.value);
}
    function withdraw() external {
        require(msg.sender == owner, "Not owner!");
        emit Withdraw (address(this).balance);
        selfdestruct(payable(msg.sender));
}
}


// This Solidity code showcases various features related to sending and receiving Ether, as well as self-destruct functionality. 
// It includes contracts for sending Ether (SendEther), receiving Ether (ReceiveEther), and self-destructing (SelfDestruct). 
// These contracts demonstrate the versatility of Ethereum smart contracts in handling financial transactions and contract lifecycle management. 
//The code employs different methods like transfer, send, and call for Ether transfers, and it utilizes events to log transaction details for monitoring purposes. 
// Additionally, the self-destruct contract (SelfDestruct) illustrates how contracts can be terminated and Ether can be withdrawn under specific conditions. 
// Overall, this code exemplifies the capabilities of Solidity in building decentralized financial applications while adhering to best practices for contract 
//interaction and management.





