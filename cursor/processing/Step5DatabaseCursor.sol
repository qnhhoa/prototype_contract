// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Step5Database} from "../../database/processing/Step5Database.sol";

abstract contract Step5DatabaseCursor {
    Step5Database public step5Database;

    constructor(address value) {
        step5Database = Step5Database(value);
    }
}
