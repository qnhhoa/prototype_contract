// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step6} from "../../struct/processing/Step6.sol";

contract Step6Database is Ownable {
    Step6[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "Step6Database: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "Step6Database: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addStep6(Step6 memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 Step6Id) public onlyPermissions {
        list[Step6Id].step6IsChecked = true;
    }

    function getAllStep6()
        public
        view
        onlyPermissions
        returns (Step6[] memory)
    {
        return list;
    }
}
