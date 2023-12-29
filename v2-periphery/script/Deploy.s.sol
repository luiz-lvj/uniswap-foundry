// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "../src/UniswapV2Router02.sol";
import "../src/test/WETH9.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        WETH9 weth = new WETH9();

        address factory = 0xf65ee12fA5bE11c0E0e9b9A4528291ebc6113ac1;
        

        // Deploy UniswapV2Factory
        UniswapV2Router02 router = new UniswapV2Router02(
            factory,
            address(weth)
        );

        console.log("Deployed UniswapV2Router02 at address: %s", address(router));
        console.log("Deployed WETH at address: %s", address(weth));
        

        vm.stopBroadcast();
    }
}