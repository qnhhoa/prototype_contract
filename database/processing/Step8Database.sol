// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step8} from "../../struct/processing/Step8.sol";

contract Step8Database is Ownable {
    Step8[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "Step8Database: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "Step8Database: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addStep8(Step8 memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 Step8Id) public onlyPermissions {
        list[Step8Id].step8IsChecked = true;
    }

    function getAllStep8()
        public
        view
        onlyPermissions
        returns (Step8[] memory)
    {
        return list;
    }
}
