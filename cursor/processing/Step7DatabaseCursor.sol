// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Step7Database} from "../../database/processing/Step7Database.sol";

abstract contract Step7DatabaseCursor {
    Step7Database public step7Database;

    constructor(address value) {
        step7Database = Step7Database(value);
    }
}
