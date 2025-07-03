// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;


// contract AdvancedCalculator{
//     uint256 result = 0;
//     function add(uint256 a, uint256 b) public  {
//         result = a + b;
//     }

//     function subtract(uint256 a, uint256 b) public  {
//         result = a - b;
//     }

//     function multiply(uint256 a, uint256 b) public  {
//         result = a * b;
//     }

//     function divide(uint256 a, uint256 b) public  {
//         require(b != 0, "division by zero is not accepted");
//         result = a / b;
//     }

//     function addToTotal(uint256 c) public{
//         result = result + c;
//     }

//     function subtractFromTotal(uint256 d) public{
//         result = result - d;
//     }

//     function resetAll() public {
//         result = 0;
//     }

//     function getResult() public view returns(uint256){
//         return result;
//     }
// }

contract AdvancedCalculator {
    uint256 private result;

    // Stateless pure math operations
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }

    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Division by zero is not allowed");
        return a / b;
    }

    // Stateful operations
    function addToTotal(uint256 c) public {
        result += c;
    }

    function subtractFromTotal(uint256 d) public {
        result -= d;
    }

    function resetTotal() public {
        result = 0;
    }

    function getResult() public view returns (uint256) {
        return result;
    }

    // Bonus: calculate percentage
    function percentage(uint256 total, uint256 percent) public pure returns (uint256) {
        return (total * percent) / 100;
    }
}
