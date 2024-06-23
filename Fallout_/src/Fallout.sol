// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/math/Math.sol";

contract Fallout {
    using Math for uint256;

    mapping(address => uint256) allocations;
    address payable public owner;

    /* constructor */
    function Fal1out() public payable {
        owner = payable(msg.sender);
        allocations[owner] = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function allocate() public payable {
        (bool success, uint256 newValue) = allocations[msg.sender].tryAdd(uint256(msg.value));

        if(!success) {
            revert("Overflow detected");
        } else {
            allocations[msg.sender] = newValue;
        }

    }

    function sendAllocation(address payable allocator) public {
        require(allocations[allocator] > 0);
        allocator.transfer(allocations[allocator]);
    }

    function collectAllocations() public onlyOwner {

        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transfer failded");

    }

    function allocatorBalance(address allocator) public view returns (uint256) {
        return allocations[allocator];
    }
}