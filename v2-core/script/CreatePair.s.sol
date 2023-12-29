// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "../src/UniswapV2Factory.sol";

contract CreatePair is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // Deploy UniswapV2Factory
        UniswapV2Factory factory = UniswapV2Factory(0x549429121b36f47FcAb59a7DCB24e62115A1176c);

        address tokenA =   0xcd0A91FBC4D894820dffa1d4eF854c9c6f4B0FFb; //2K
        address tokenB = 0x0a4cc877dAb8DDC00ed9EaDCF964930C1cB2Cf2c; // RYU

        address pair = factory.createPair(tokenA, tokenB);

        console.log("UniswapV2Pair deployed at address: %s", address(pair));
       

        vm.stopBroadcast();
    }
}