// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step4} from "../../struct/processing/Step4.sol";

contract Step4Database is Ownable {
    Step4[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "Step4Database: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "Step4Database: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addStep4(Step4 memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 Step4Id) public onlyPermissions {
        list[Step4Id].step4IsChecked = true;
    }

    function getAllStep4()
        public
        view
        onlyPermissions
        returns (Step4[] memory)
    {
        return list;
    }
}
