// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Product_Owner{
    uint256 productOwnerId;
    uint256 batchId;
    uint256 productCode;
    uint256 manufacturerId;
    uint256[] distributorIds;
    uint256[] martketIds;
    uint256[] staffIds;
    uint256[] customerIds;
    string dateTime;
}
