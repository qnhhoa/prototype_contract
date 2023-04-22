// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Step3Database} from "../../database/processing/Step3Database.sol";

abstract contract Step3DatabaseCursor {
    Step3Database public step3Database;

    constructor(address value) {
        step3Database = Step3Database(value);
    }
}
