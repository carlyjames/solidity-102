// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract EventExample {
    
    struct User{
        string username;
        uint256 age;
    }

    mapping(address => User) public users;

    event NewUserRegistered(address indexed user, uint256 username);

    function registerUser(string memory _username, uint256  _age) public{
        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.age = _age;

        emit NewUserRegistered(msg.sender, _age);
    }
}