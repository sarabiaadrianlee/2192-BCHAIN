// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GlobalVariables {
    function globalVars() external view returns (address, uint, uint, uint, uint, address) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;
        uint gasPrice = tx.gasprice;
        uint blockGas = block.gaslimit;
        address blockCoin = block.coinbase;
        return (sender, timestamp, blockNum, gasPrice, blockGas, blockCoin);
    }
}

//Solidity's GlobalVariables contract demonstrates how to access essential blockchain information like the sender's address, block details, 
//and transaction parameters, providing developers with crucial insights for building robust decentralized applications.