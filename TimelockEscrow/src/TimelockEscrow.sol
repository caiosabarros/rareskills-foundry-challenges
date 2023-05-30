// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TimelockEscrow {
    address public seller;
    uint depositTime;
    address buyer;
    mapping (address => uint) balances;
    /**
     * The goal of this exercise is to create a Time lock escrow.
     * A buyer deposits ether into a contract, and the seller cannot withdraw it until 3 days passes. Before that, the buyer can take it back
     * Assume the owner is the seller
     */

    constructor() {
        seller = msg.sender;
    }

    // creates a buy order between msg.sender and seller
    /**
     * escrows msg.value for 3 days which buyer can withdraw at anytime before 3 days but afterwhich only seller can withdraw
     * should revert if an active escrow still exist or last escrow hasn't been withdrawn
     */
    function createBuyOrder() external payable {
        // your code here
        require(buyer == address(0), "there is a buyer already");
        require(address(this).balance >= 0,"balance is non-zero");
        buyer = msg.sender;
        depositTime = block.timestamp;
        balances[msg.sender] += msg.value;
    }

    /**
     * allows seller to withdraw after 3 days of the escrow with @param buyer has passed
     */
    function sellerWithdraw(address buyer) external {
        // your code here
        require(block.timestamp > depositTime + 3 days, "time has not arrived");
        require(buyer != address(0));
        (bool ok, ) = msg.sender.call{value: address(this).balance}("");
        buyer = address(0);
    }

    /**
     * allowa buyer to withdraw at anytime before the end of the escrow (3 days)
     */
    function buyerWithdraw() external {
        require(block.timestamp <= depositTime + 3 days, "times elapsed");
        (bool ok,) = msg.sender.call{value: balances[msg.sender]}("");
    }

    // returns the escrowed amount of @param buyer
    function buyerDeposit(address _buyer) external view returns (uint256) {
        // your code here
        return balances[_buyer];

    }
}
