// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FilterOddNumbers {
    /*
        This exercise assumes you understand how to manipulate Array.
        1. Function `filterOdd` takes an array of uint256 as argument. 
        2. Filter and return an array with the odd numbers removed.
        Note: this is tricky because you cannot allocate a dynamic array in memory, 
              you need to count the even numbers then declare an array of that size.
    */

    function filterOdd(uint256[] memory _arr)
        public
        view
        returns (uint256[] memory)
    {
        uint8 counter;
        for(uint256 i=0; i<_arr.length;){
            if(_arr[i] % 2 == 0){
                ++counter;
            }
            unchecked {
                ++i;
            }
        }
        uint256[] memory arr = new uint256[](counter);
        
        counter = 0;
        for(uint256 i=0; i<_arr.length;) {
            if(_arr[i] % 2 == 0){
                arr[counter] = _arr[i];
                ++counter;
            }
            unchecked {
                ++i;
            }
        }
        return arr;
    }
}
