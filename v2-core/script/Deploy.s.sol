// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "../src/UniswapV2Factory.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // Deploy UniswapV2Factory
        UniswapV2Factory factory = new UniswapV2Factory(msg.sender);

        console.log("UniswapV2Factory deployed at address: %s", address(factory));
        

        vm.stopBroadcast();
    }
}