// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IfStatement {
    function max(uint256 a, uint256 b) public pure returns (uint256) {
        bool gt = a > b;
        if(gt) {
            return a;
        } else {
            return b;
        }
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        // return the minimum of a and b
        bool lt = a < b;
        if(lt) {
            return a;
        } else {
            return b;
        }
    }
}
