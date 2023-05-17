// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {UserDatabaseCursor} from "../../cursor/user/UserDatabaseCursor.sol";
import {User} from "../../struct/user/User.sol";
import {OwnerDatabaseCursor} from "../../cursor/user/OwnerDatabaseCursor.sol";
import {Product_Owner} from "../../struct/user/Owner.sol";

contract UserController is Ownable, UserDatabaseCursor, OwnerDatabaseCursor {
    constructor(address userDatabaseContractAddress, address ownerDatabaseContractAddress)
        Ownable()
        UserDatabaseCursor(userDatabaseContractAddress)
        OwnerDatabaseCursor(ownerDatabaseContractAddress)
    {}

    function login() public view returns (User memory) {
        User[] memory list = userDatabase.getAllUser();
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].userAddress == _msgSender()) return list[i];
        }
        return User(0, "","","","",0,"","", address(0), 0);
    }

    function addUser(string memory userName,string memory userRole,string memory userType, string memory dateOfBirth, uint256 userCccd, string memory userEmail, string memory userPhone, uint256 teamId)
        public
        onlyNotExistUser
    {
        User memory item = User(0, userName,userRole,userType,dateOfBirth,userCccd,userEmail,userPhone,_msgSender(),teamId);
        userDatabase.addUser(item);
    }

    function getAllUser() public view onlyOwner returns (User[] memory) {
        return userDatabase.getAllUser();
    }

    function addOwner(
        uint256 batchId,
        string memory productName,
        string memory ownerName,
        string memory dateTime,
        string memory ownerEmail,
        string memory ownerPhoneNumber
    ) public {
        Product_Owner memory item = Product_Owner(
            batchId,
            productName,
            ownerName,
            dateTime,
            ownerEmail,
            ownerPhoneNumber,
            false
        );
        return ownerDatabase.addOwner(item);
    }

    function getAllOwner() public view returns (Product_Owner[] memory) {
        return ownerDatabase.getAllOwner();
    }

}
