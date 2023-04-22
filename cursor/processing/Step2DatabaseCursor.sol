// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Step2Database} from "../../database/processing/Step2Database.sol";

abstract contract Step2DatabaseCursor {
    Step2Database public step2Database;

    constructor(address value) {
        step2Database = Step2Database(value);
    }
}
