// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Payable{
    address payable public owner;

    constructor() payable{
        owner = payable(msg.sender);
    }

    function deposit() public payable{}

    function withdraw() public{
        uint amount = address(this).balance;
        (bool success, ) = owner.call{value: amount}("");
        require(success, "failed to send ether");
    } 

       // Function to transfer Ether from this contract to address from input
    function transfer(address _to, uint _amount) public{
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "failed to send ether");
    }


}
