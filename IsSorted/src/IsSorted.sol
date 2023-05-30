// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public pure returns (bool) {
        // your code here
        uint256 bigger = arr[0];
        if (arr.length == 1) {
            return true;
        }
        for (uint256 i = 1; i < arr.length;) {
            if (arr[i] >= bigger) {
             bigger = arr[i];
            } else {
                return false;
            }
            unchecked {
                ++i;
            }
        }
        return (bigger == arr[arr.length - 1]);
    }
}
