// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Purchase {
    uint256 purchaseId;
    uint256 productCode;
    uint256 batchId;
    address userAddress;
    string purchaseLocated;
    string purchaseDate;
}
