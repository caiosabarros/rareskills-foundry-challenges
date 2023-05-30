// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ReducingPayout {
    /*
        This exercise assumes you know how block.timestamp works.
        1. This contract has 1 ether in it, each second that goes by, 
           the amount that can be withdrawn by the caller goes from 100% to 0% as 24 hours passes.
        2. Implement your logic in `withdraw` function.
        Hint: 1 second deducts 0.0011574% from the current %.
    */

    // The time 1 ether was sent to this contract
    uint256 public immutable depositedTime;

    constructor() payable {
        depositedTime = block.timestamp;
    }

    function withdraw() public {
        // Calculate the elapsed time since the ether was deposited
        uint256 elapsedTime = block.timestamp - depositedTime;

        // Calculate the reduction factor based on elapsed time
        uint256 reductionFactor = elapsedTime * 11574 / 10000;  // 0.0011574% = 0.11574 / 100

        // Calculate the amount that can be withdrawn
        uint256 amountWithdraw;
        if(block.timestamp < 86400) {
            amountWithdraw = 1 ether - ((block.timestamp * 0.0011574 ether) / 100);
        } else {
            amountWithdraw = 0 ether;
        }
        // Transfer the calculated amount to the caller

        (bool ok, ) = msg.sender.call{value: amountWithdraw}("");
        require(ok, "Failed to transfer funds");
    }
}
