// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Subsystem} from "../../struct/subsystem/sub.sol";

contract SubsystemDatabase is Ownable {
    Subsystem[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "SubsystemDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "SubsystemDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addSubsystem(Subsystem memory subsystem) public onlyPermissions {
        uint256 id = autoIncrement++;
        subsystem.subId = id;
        list.push(subsystem);
    }

    function getAllSubsystem() public view onlyPermissions returns (Subsystem[] memory) {
        return list;
    }
}
