// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {UserDatabaseCursor} from "../../cursor/user/UserDatabaseCursor.sol";
import {User} from "../../struct/user/User.sol";

contract UserController is Ownable, UserDatabaseCursor {
    constructor(address userDatabaseContractAddress)
        Ownable()
        UserDatabaseCursor(userDatabaseContractAddress)
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
}
