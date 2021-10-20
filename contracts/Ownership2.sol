
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Ownership2 {
    
    enum Stages { Deposits, Withdraws }
    
    Stages public stage = Stages.Deposits;
    
    mapping(address => uint) public balances;
    uint public creationTime = block.timestamp;

  function deposit() payable public {
      require(stage == Stages.Deposits && msg.value > 0);
      balances[msg.sender] += msg.value;
  }
      
  function withdraw() public {
      if(stage != Stages.Withdraws && block.timestamp >= creationTime + 30 days) {
          stage = Stages.Withdraws;
      }
      require(stage == Stages.Withdraws && balances[msg.sender] > 0);
      uint amount = balances[msg.sender];
      balances[msg.sender] = 0;
      msg.sender.transfer(amount);
  }
}