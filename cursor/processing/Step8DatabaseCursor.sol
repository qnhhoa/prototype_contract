// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Step8Database} from "../../database/processing/Step8Database.sol";

abstract contract Step8DatabaseCursor {
    Step8Database public step8Database;

    constructor(address value) {
        step8Database = Step8Database(value);
    }
}
