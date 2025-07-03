// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Calculator {
    uint256 result = 0;
    function add(uint256 num) public {
        result += num;
    }

    function subtract(uint256 num) public {
        result -= num;
    }

    function multiply(uint256 num) public {
        result *= num;
    }

    function divide(uint256 num) public  {
        result /= num;
    }

    function algebra(uint256 a, uint256 b) public {
        result =  (a * a) + (2 * a * b) + (b * b);
    }

    // get calcultor result
    function getresult() public view returns (uint256){
        return result;
    }
}