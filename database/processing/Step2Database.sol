// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step2} from "../../struct/processing/Step2.sol";

contract Step2Database is Ownable {
    Step2[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "Step2Database: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "Step2Database: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addStep2(Step2 memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 Step2Id) public onlyPermissions {
        list[Step2Id].step2IsChecked = true;
    }

    function getAllStep2()
        public
        view
        onlyPermissions
        returns (Step2[] memory)
    {
        return list;
    }
}
