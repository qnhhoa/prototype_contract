// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Product_Owner} from "../../struct/user/Owner.sol";

contract OwnerDatabase is Ownable {
    Product_Owner[] private list;
    uint256 private autoIncrement = 0;

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
        uint256 id = autoIncrement++;
        item.productOwnerId = id;
        list.push(item);
    }

    function addDistributorId(
        uint256 productOwnerId,
        uint256 distributorId
    ) public {
        list[productOwnerId].distributorIds.push(distributorId);
    }

    function addMartketId(
        uint256 productOwnerId,
        uint256 martketId
    ) public {
        list[productOwnerId].martketIds.push(martketId);
    }

    function addStaffId(
        uint256 productOwnerId,
        uint256 staffId
    ) public {
        list[productOwnerId].staffIds.push(staffId);
    }

    function addCustomerId(
        uint256 productOwnerId,
        uint256 customerId
    ) public {
        list[productOwnerId].customerIds.push(customerId);
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
