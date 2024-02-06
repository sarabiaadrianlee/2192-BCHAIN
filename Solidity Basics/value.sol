// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract value {
    bool public b = true;
    uint public u = 123;

    int public i = -123;

    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0x8C8D7C46219D9205f056f28fee5950aD564d7465;
    bytes32 public b32 = 0x626c756500000000000000000000000000000000000000000000000000000000;

}