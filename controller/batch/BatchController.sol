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

    function addBatch(string memory batchName,uint256 numOfProcess, string memory categories)
        public
    {
        Batch memory item = Batch(0, batchName,numOfProcess,categories,false);
        batchDatabase.addBatch(item);
    }

    function getAllBatch() public view onlyOwner returns (Batch[] memory) {
        return batchDatabase.getAllBatch();
    }
}
