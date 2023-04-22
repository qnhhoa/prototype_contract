// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Step6Database} from "../../database/processing/Step6Database.sol";

abstract contract Step6DatabaseCursor {
    Step6Database public step6Database;

    constructor(address value) {
        step6Database = Step6Database(value);
    }
}
