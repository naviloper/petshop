// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Ownership {

  address payable owner;
  constructor() public {

    owner = msg.sender;

  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Not authorized");
    _;
  }

  function withdraw(uint _amount) onlyOwner public {
    owner.transfer(_amount);
  }

}
