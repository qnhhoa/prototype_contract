// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step7} from "../../struct/processing/Step7.sol";

contract Step7Database is Ownable {
    Step7[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "Step7Database: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "Step7Database: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addStep7(Step7 memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 Step7Id) public onlyPermissions {
        list[Step7Id].step7IsChecked = true;
    }

    function getAllStep7()
        public
        view
        onlyPermissions
        returns (Step7[] memory)
    {
        return list;
    }
}
