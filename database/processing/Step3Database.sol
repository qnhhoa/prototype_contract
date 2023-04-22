// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step3} from "../../struct/processing/Step3.sol";

contract Step3Database is Ownable {
    Step3[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "Step3Database: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "Step3Database: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addStep3(Step3 memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 Step3Id) public onlyPermissions {
        list[Step3Id].step3IsChecked = true;
    }

    function getAllStep3()
        public
        view
        onlyPermissions
        returns (Step3[] memory)
    {
        return list;
    }
}
