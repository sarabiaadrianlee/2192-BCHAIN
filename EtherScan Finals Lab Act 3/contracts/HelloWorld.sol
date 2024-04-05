// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;

contract HelloWorld {
event UpdatedMessages (string oldStr, string newStr);
string public message;
constructor(string memory initMessage) { 
message = initMessage;
}

// A public function that accepts a string argument and updates the message storage variable.
function update (string memory newMessage) public { 
    string memory oldMsg = message;
message = newMessage;
emit UpdatedMessages (oldMsg, newMessage);
}
}