// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

import {PurchaseDatabase} from "../../database/purchase/PurchaseDatabase.sol";

abstract contract PurchaseDatabaseCursor {
    PurchaseDatabase public purchaseDatabase;

    constructor(address value) {
        purchaseDatabase = PurchaseDatabase(value);
    }
}
