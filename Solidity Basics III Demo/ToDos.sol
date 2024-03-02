// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./4_Structs_demo.sol";

contract Todos {
    Todo[] public todos;

    function todoList() public{
        Todo memory newTask = Todo("blockchain", true);
        todos.push(newTask);
    }
} 