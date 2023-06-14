// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {BatchDatabaseCursor} from "../../cursor/batch/BatchDatabaseCursor.sol";
import {Batch} from "../../struct/batch/batch.sol";

contract BatchController is Ownable, BatchDatabaseCursor {
    constructor(address batchDatabaseContractAddress)
        Ownable()
        BatchDatabaseCursor(batchDatabaseContractAddress)
    {}

    function addBatch(uint256 userId, uint256 teamId, string memory batchName,uint256 numOfProcess, string memory categories,string memory verifyCode)
        public
    {
        Batch memory item = Batch(0,userId,teamId,batchName,numOfProcess,categories,verifyCode,false);
        batchDatabase.addBatch(item);
    }

    function getAllBatch() public view onlyOwner returns (Batch[] memory) {
        return batchDatabase.getAllBatch();
    }
}
