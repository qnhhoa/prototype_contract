// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {OwnerDatabase} from "../../database/user/OwnerDatabase.sol";

abstract contract OwnerDatabaseCursor {
    OwnerDatabase public ownerDatabase;

    constructor(address value) {
        ownerDatabase = OwnerDatabase(value);
    }
}
