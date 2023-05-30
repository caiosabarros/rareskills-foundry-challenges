// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */

    function getLowerPrice(
        address _priceOracle1,
        address _priceOracle2
    ) external returns (uint256) {
        (bool success, bytes memory firstPrice) = _priceOracle1.call(abi.encodeWithSignature("price()"));
        (bool successes, bytes memory secondPrice) = _priceOracle2.call(abi.encodeWithSignature("price()"));
        uint256 first = abi.decode(firstPrice, (uint256));
        uint256 second = abi.decode(secondPrice, (uint256));
        if(first > second) {
            return second;
        } else {
            return first;
        }
    }
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}

contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
