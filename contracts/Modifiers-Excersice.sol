// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Modifier {
    
    address public owner;
    bool public paused;

    mapping (address => uint) public balance;

    constructor(){
        owner = msg.sender;
        paused = false;
        balance[owner] = 10000;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "contract only allowed by the owner");
        _;
    }

    modifier notPaused(){
        require(paused == false, "contract is paused");
        _;
    }

    function pause() public onlyOwner{
        paused = true;
    }

    function unpause() public onlyOwner{
        paused = false;
    }

    function transfer(address to, uint amount) public notPaused{
        require(balance[msg.sender] >= amount, "insufficient balance");

        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

}