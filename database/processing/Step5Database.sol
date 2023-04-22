// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step5} from "../../struct/processing/Step5.sol";

contract Step5Database is Ownable {
    Step5[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "Step5Database: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "Step5Database: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addStep5(Step5 memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 Step5Id) public onlyPermissions {
        list[Step5Id].step5IsChecked = true;
    }

    function getAllStep5()
        public
        view
        onlyPermissions
        returns (Step5[] memory)
    {
        return list;
    }
}
