// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Fallout} from "../src/Fallout.sol";

contract TestFallout is Test {
    Fallout falloutInstance;
    address USER = makeAddr("Iconart"); //represent an external user

    uint256 constant STARTING_BALANCE = 10 ether;

    function setUp() external {
        falloutInstance = new Fallout(); //create new fallout instance
        vm.deal(USER, STARTING_BALANCE);
    }

    function testIsOwner() public {
        falloutInstance.Fal1out{value: 1 ether}();
        console.log(falloutInstance.owner(), address(this));
        assertEq(falloutInstance.owner(), address(this));
    }

    function testAllocationBalance() public {
        falloutInstance.Fal1out{value: 1 ether}();
        uint256 balance = falloutInstance.allocatorBalance(falloutInstance.owner());
        assertEq(balance, 1 ether);

    }
}