// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

struct Batch {
    uint256 batchId;
    uint256 userId;
    uint256 teamId;
    string batchName;
    uint256 numOfProcess;
    string categories;
    string verifyCode;
    bool batchIsChecked;
}
