// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step1} from "../../struct/processing/Step1.sol";

contract Step1Database is Ownable {
    Step1[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "Step1Database: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "Step1Database: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addStep1(Step1 memory step1) public onlyPermissions {
        uint256 id = autoIncrement++;
        step1.productCode = id;
        list.push(step1);
    }

    function addChecked(uint256 step1Id) public onlyPermissions {
        list[step1Id].step1IsChecked = true;
    }

    function getAllStep1()
        public
        view
        onlyPermissions
        returns (Step1[] memory)
    {
        return list;
    }
}
