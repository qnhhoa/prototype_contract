// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {PurchaseDatabaseCursor} from "../../cursor/purchase/PurchaseDatabaseCursor.sol";
import {Purchase} from "../../struct/purchase/purchase.sol";

contract PurchaseController is Ownable, PurchaseDatabaseCursor {
    constructor(address purchaseDatabaseContractAddress)
        Ownable()
        PurchaseDatabaseCursor(purchaseDatabaseContractAddress)
    {}

    function addPurchase(uint256 productCode, uint256 batchId, string memory customerName, string memory purchaseLocated, string memory purchaseDate)
        public
    {
        Purchase memory item = Purchase(0,productCode,batchId,_msgSender(),customerName,purchaseLocated,purchaseDate);
        purchaseDatabase.addPurchase(item);
    }

    function getAllPurchase() public view onlyOwner returns (Purchase[] memory) {
        return purchaseDatabase.getAllPurchase();
    }
}
