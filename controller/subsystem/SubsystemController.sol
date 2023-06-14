// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Subsystem} from "../../struct/subsystem/sub.sol";
import {SubsystemDatabaseCursor} from "../../cursor/subsystem/SubsystemDatabaseCursor.sol";

contract SubsystemController is Ownable, SubsystemDatabaseCursor
{
    constructor(address subsystemDatabaseContractAddress)
        Ownable()
        SubsystemDatabaseCursor(subsystemDatabaseContractAddress)
    {}

    function addSubsystem(
        string memory typeOfSubsystem,
        string memory registerDate)
        public
    {
        Subsystem memory item = Subsystem(0,_msgSender(),typeOfSubsystem,registerDate);
        subsystemDatabase.addSubsystem(item);
    }


    function getAllSubsystem() public view returns (Subsystem[] memory) {
        return subsystemDatabase.getAllSubsystem();
    }
}

