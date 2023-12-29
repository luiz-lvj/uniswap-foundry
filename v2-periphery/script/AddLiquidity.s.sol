// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import "../src/UniswapV2Router02.sol";
import "../src/test/WETH9.sol";

contract AddLiquidity is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        
        UniswapV2Router02 router = UniswapV2Router02(payable(0xcbC9ce7898517049175280288f3838593Adcc660));

        address tokenA = 0xcd0A91FBC4D894820dffa1d4eF854c9c6f4B0FFb; //2K
        address tokenB = 0x0a4cc877dAb8DDC00ed9EaDCF964930C1cB2Cf2c; // RYU

        IERC20(tokenA).approve(address(router), 1000 ether);
        IERC20(tokenB).approve(address(router), 2000 ether);

        (uint256 amountA, uint256 amountB, uint256 liquidity) = router.addLiquidity(
            tokenA,
            tokenB,
            1000 ether,
            2000 ether,
            1000 ether,
            2000 ether,
            msg.sender,
            block.timestamp + 100 days
        );

        console.log("amountA: %s", amountA);
        console.log("amountB: %s", amountB);
        console.log("liquidity: %s", liquidity);

        vm.stopBroadcast();
    }
}