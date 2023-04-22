// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Step4Database} from "../../database/processing/Step4Database.sol";

abstract contract Step4DatabaseCursor {
    Step4Database public step4Database;

    constructor(address value) {
        step4Database = Step4Database(value);
    }
}
