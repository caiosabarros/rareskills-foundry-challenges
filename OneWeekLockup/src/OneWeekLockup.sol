// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */
    mapping (address => uint) balances;
    mapping (address => uint) depositTime;
    //two diff mappings

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return balances[msg.sender];
    }

    function depositEther() external payable {
        balances[msg.sender] += msg.value;
        depositTime[msg.sender] = block.timestamp;
        /// add code here
    }

    function withdrawEther(uint256 amount) external {
        /// add code here
        require(balances[msg.sender]>=amount, "not enough");
        require(block.timestamp >= depositTime[msg.sender] + 1 weeks, "not yet");
        balances[msg.sender] -= amount;
        (bool ok, ) = msg.sender.call{value:amount}("");
    }
}
