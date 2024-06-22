// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Level0} from "../src/level0.sol";
import "forge-std/console.sol";

contract DeployLevel0 is Script {

    //Level0 contract instance
    Level0 public level0 = Level0(0xD8c1d88f05323dC229eF7aE9611c4Efc43512952);

    function run() external {

      string memory password = level0.password();

      vm.startBroadcast();
      level0.authenticate(password);
      vm.stopBroadcast();
       
    }
}