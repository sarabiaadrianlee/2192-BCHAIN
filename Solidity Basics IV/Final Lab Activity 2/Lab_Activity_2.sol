// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyFinalsActivity2 {
    address payable public owner;
    uint256 public constant INITIAL_ETH_AMOUNT = 2 ether;
    uint256 public remainingEth;
    uint256 public creationTime;

    event EtherReceived(address indexed from, uint256 amount);
    event EtherSent(address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = payable(msg.sender);
        creationTime = block.timestamp;
        remainingEth = INITIAL_ETH_AMOUNT;
    }

    receive() external payable {
        emit EtherReceived(msg.sender, msg.value);
    }
    
    function ReceivedAndEmit() external payable {
        emit EtherReceived(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendEther(address payable _recipient, uint256 _amount) public onlyOwner {
        require(_amount <= remainingEth, "Insufficient funds in the contract");
        _recipient.transfer(_amount);
        remainingEth -= _amount;
        emit EtherSent(_recipient, _amount);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

// MyFinalsActivity2 is a Solidity contract managing Ether transactions with ownership control. 
// It initializes with an owner and fixed Ether amount, offering functions for sending and receiving Ether,
// along with event logging. Additionally, it includes a balance-checking function and a self-destruct feature restricted to the owner, 
//showcasing basic Ether management in a blockchain setting.