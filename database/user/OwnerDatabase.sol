// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Product_Owner} from "../../struct/user/Owner.sol";

contract OwnerDatabase is Ownable {
    Product_Owner[] private list;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "OwnerDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "OwnerDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addOwner(Product_Owner memory item) public onlyPermissions {
        list.push(item);
    }

    function addChecked(uint256 BatchId) public onlyPermissions {
        list[BatchId].ownerIsChecked = true;
    }

    function getAllOwner()
        public
        view
        onlyPermissions
        returns (Product_Owner[] memory)
    {
        return list;
    }
}
