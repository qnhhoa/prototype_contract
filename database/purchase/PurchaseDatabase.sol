// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Purchase} from "../../struct/purchase/purchase.sol";

contract PurchaseDatabase is Ownable {
    Purchase[] private list;
    uint256 private autoIncrement = 0;

    mapping(address => bool) private permissions;

    modifier onlyPermissions() {
        require(
            permissions[_msgSender()],
            "PurchaseDatabase: only contract which are allowed"
        );
        _;
    }

    constructor() Ownable() {}

    function addPermission(address contractPermission) public onlyOwner {
        require(
            !permissions[contractPermission],
            "PurchaseDatabase: permission has been granted"
        );
        permissions[contractPermission] = true;
    }

    function addPurchase(Purchase memory purchase) public onlyPermissions {
        uint256 id = autoIncrement++;
        purchase.purchaseId = id;
        list.push(purchase);
    }

    function getAllPurchase() public view onlyPermissions returns (Purchase[] memory) {
        return list;
    }
}
