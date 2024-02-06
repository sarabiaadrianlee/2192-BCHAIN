// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LocalVariables {
    uint public  i;
    bool public  b;
   
    address public myAddress;

    function foo() external {
        uint x = 123;
        bool f = false;

      

        x += 4456;
        f = true;

        i = 123;
        b = true;
        myAddress = address(1);
    }
    
}

//function foo is not payable when you click it.
// when you first call the variables without call the function foo it has no change
// when you call the function foo it then changes to the value given in the function
// variables b and i changes from 0 and false to 123 and true.
// and then address adds a number 1 on the end of the address.
