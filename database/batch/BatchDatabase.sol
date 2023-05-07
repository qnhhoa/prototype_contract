// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Batch} from "../../struct/batch/batch.sol";

contract BatchDatabase is Ownable {
    Batch[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "BatchDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "BatchDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addBatch(Batch memory batch) public onlyPermissions {
        uint256 id = autoIncrement++;
        batch.batchId = id;
        list.push(batch);
    }

    function addChecked(uint256 batchId) public onlyPermissions {
        list[batchId].batchIsChecked = true;
    }

    function getAllBatch() public view onlyPermissions returns (Batch[] memory) {
        return list;
    }
}
