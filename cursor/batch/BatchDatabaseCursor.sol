// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {BatchDatabase} from "../../database/batch/BatchDatabase.sol";

abstract contract BatchDatabaseCursor {
    BatchDatabase public batchDatabase;

    constructor(address value) {
        batchDatabase = BatchDatabase(value);
    }
}
