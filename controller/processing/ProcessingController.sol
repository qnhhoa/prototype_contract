// SPDX-License-Identifier: MIT
pragma solidity >=0.8.14 <0.9.0;

import {Ownable} from "../../abstract/Ownable.sol";
import {Step1DatabaseCursor} from "../../cursor/processing/Step1DatabaseCursor.sol";
import {Step2DatabaseCursor} from "../../cursor/processing/Step2DatabaseCursor.sol";
import {Step3DatabaseCursor} from "../../cursor/processing/Step3DatabaseCursor.sol";
import {Step4DatabaseCursor} from "../../cursor/processing/Step4DatabaseCursor.sol";
import {Step5DatabaseCursor} from "../../cursor/processing/Step5DatabaseCursor.sol";
import {Step6DatabaseCursor} from "../../cursor/processing/Step6DatabaseCursor.sol";
import {Step7DatabaseCursor} from "../../cursor/processing/Step7DatabaseCursor.sol";
import {Step8DatabaseCursor} from "../../cursor/processing/Step8DatabaseCursor.sol";
import {Step1} from "../../struct/processing/Step1.sol";
import {Step2} from "../../struct/processing/Step2.sol";
import {Step3} from "../../struct/processing/Step3.sol";
import {Step4} from "../../struct/processing/Step4.sol";
import {Step5} from "../../struct/processing/Step5.sol";
import {Step6} from "../../struct/processing/Step6.sol";
import {Step7} from "../../struct/processing/Step7.sol";
import {Step8} from "../../struct/processing/Step8.sol";

contract ProcessingController is
    Ownable,
    Step1DatabaseCursor,
    Step2DatabaseCursor,
    Step3DatabaseCursor,
    Step4DatabaseCursor,
    Step5DatabaseCursor,
    Step6DatabaseCursor,
    Step7DatabaseCursor,
    Step8DatabaseCursor
{
    constructor(
        address step1DatabaseContractAddress,
        address step2DatabaseContractAddress,
        address step3DatabaseContractAddress,
        address step4DatabaseContractAddress,
        address step5DatabaseContractAddress,
        address step6DatabaseContractAddress,
        address step7DatabaseContractAddress,
        address step8DatabaseContractAddress
    )
        Ownable()
        Step1DatabaseCursor(step1DatabaseContractAddress)
        Step2DatabaseCursor(step2DatabaseContractAddress)
        Step3DatabaseCursor(step3DatabaseContractAddress)
        Step4DatabaseCursor(step4DatabaseContractAddress)
        Step5DatabaseCursor(step5DatabaseContractAddress)
        Step6DatabaseCursor(step6DatabaseContractAddress)
        Step7DatabaseCursor(step7DatabaseContractAddress)
        Step8DatabaseCursor(step8DatabaseContractAddress)
    {}

    function addStep1(
        uint256 batchId,
        string memory productName,
        string memory date,
        string memory location,
        string memory photo,
        string memory userName,
        uint256 userCccd,
        string memory categories
    ) public {
        Step1 memory item = Step1(
            0,
            batchId,
            productName,
            date,
            location,
            photo,
            userName,
            userCccd,
            categories,
            false
        );
        return step1Database.addStep1(item);
    }

    function getAllStep1() public view returns (Step1[] memory) {
        return step1Database.getAllStep1();
    }

    function addStep2(
        uint256 productCode,
        uint256 batchId,
        string memory productName,
        string memory date,
        string memory location,
        string memory photo,
        string memory userName,
        uint256 userCccd,
        string memory categories
    ) public {
        Step2 memory item = Step2(
            productCode,
            batchId,
            productName,
            date,
            location,
            photo,
            userName,
            userCccd,
            categories,
            false
        );
        return step2Database.addStep2(item);
    }

    function getAllStep2() public view returns (Step2[] memory) {
        return step2Database.getAllStep2();
    }

    function addStep3(
        uint256 productCode,
        uint256 batchId,
        string memory productName,
        string memory date,
        string memory location,
        string memory photo,
        string memory userName,
        uint256 userCccd,
        string memory categories
    ) public {
        Step3 memory item = Step3(
            productCode,
            batchId,
            productName,
            date,
            location,
            photo,
            userName,
            userCccd,
            categories,
            false
        );
        return step3Database.addStep3(item);
    }

    function getAllStep3() public view returns (Step3[] memory) {
        return step3Database.getAllStep3();
    }

    function addStep4(
        uint256 productCode,
        uint256 batchId,
        string memory productName,
        string memory date,
        string memory location,
        string memory photo,
        string memory userName,
        uint256 userCccd,
        string memory categories
    ) public {
        Step4 memory item = Step4(
            productCode,
            batchId,
            productName,
            date,
            location,
            photo,
            userName,
            userCccd,
            categories,
            false
        );
        return step4Database.addStep4(item);
    }

    function getAllStep4() public view returns (Step4[] memory) {
        return step4Database.getAllStep4();
    }

    function addStep5(
        uint256 productCode,
        uint256 batchId,
        string memory productName,
        string memory date,
        string memory location,
        string memory photo,
        string memory userName,
        uint256 userCccd,
        string memory categories
    ) public {
        Step5 memory item = Step5(
            productCode,
            batchId,
            productName,
            date,
            location,
            photo,
            userName,
            userCccd,
            categories,
            false
        );
        return step5Database.addStep5(item);
    }

    function getAllStep5() public view returns (Step5[] memory) {
        return step5Database.getAllStep5();
    }

    function addStep6(
        uint256 productCode,
        uint256 batchId,
        string memory productName,
        string memory date,
        string memory location,
        string memory photo,
        string memory userName,
        uint256 userCccd,
        string memory categories
    ) public {
        Step6 memory item = Step6(
            productCode,
            batchId,
            productName,
            date,
            location,
            photo,
            userName,
            userCccd,
            categories,
            false
        );
        return step6Database.addStep6(item);
    }

    function getAllStep6() public view returns (Step6[] memory) {
        return step6Database.getAllStep6();
    }

    function addStep7(
        uint256 productCode,
        uint256 batchId,
        string memory productName,
        string memory date,
        string memory location,
        string memory photo,
        string memory userName,
        uint256 userCccd,
        string memory categories
    ) public {
        Step7 memory item = Step7(
            productCode,
            batchId,
            productName,
            date,
            location,
            photo,
            userName,
            userCccd,
            categories,
            false
        );
        return step7Database.addStep7(item);
    }

    function getAllStep7() public view returns (Step7[] memory) {
        return step7Database.getAllStep7();
    }

    function addStep8(
        uint256 productCode,
        uint256 batchId,
        string memory productName,
        string memory date,
        string memory location,
        string memory photo,
        string memory userName,
        uint256 userCccd,
        string memory categories
    ) public {
        Step8 memory item = Step8(
            productCode,
            batchId,
            productName,
            date,
            location,
            photo,
            userName,
            userCccd,
            categories,
            false
        );
        return step8Database.addStep8(item);
    }

    function getAllStep8() public view returns (Step8[] memory) {
        return step8Database.getAllStep8();
    }

}
