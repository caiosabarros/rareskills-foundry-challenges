// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TicTacToe {
    /* 
        This exercise assumes you know how to manipulate nested array.
        1. This contract checks if TicTacToe board is winning or not.
        2. Write your code in `isWinning` function that returns true if a board is winning
           or false if not.
        3. Board contains 1's and 0's elements and it is also a 3x3 nested array.
    */

    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        // your code here
        /*
        winning will be [0][0], [1][2], [2,3] or [0][x], [1][x], [2][x] or
        [0][1,2,3] or as well.
        */
        // diagonal
        uint8 first = board[0][0];
        uint8 second = board[1][1];
        uint8 third = board[2][2];
        //check horizontal rows
        for(uint8 i=0; i<board.length;) {
            if(board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
                return true;
            }
            unchecked {
                ++i;
            }
        }
        //check columns
        for(uint8 j=0; j < 3;) {
            if(board[0][j] == board[1][j] && board[1][j] == board[2][j]){
                return true;
            }
            unchecked{
                ++j;
            }
        }
        //check diagnals
        if(first == second && second == third) {
            return true;
        }

        return false;
    }
}
