// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {SubsystemDatabase} from "../../database/subsystem/SubsystemDatabase.sol";
import {Subsystem} from "../../struct/subsystem/sub.sol";

abstract contract SubsystemDatabaseCursor {
    SubsystemDatabase public subsystemDatabase;

    constructor(address value) {
        subsystemDatabase = SubsystemDatabase(value);
    }

}
