// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Step1Database} from "../../database/processing/Step1Database.sol";

abstract contract Step1DatabaseCursor {
    Step1Database public step1Database;

    constructor(address value) {
        step1Database = Step1Database(value);
    }
}
