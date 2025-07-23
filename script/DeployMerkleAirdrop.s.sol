// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {IERC20} from "@openzeppelin/token/ERC20/IERC20.sol";
import {Script, console} from "forge-std/Script.sol";
import {TestToken} from "src/TestToken.sol";
import {MerkleAirdrop} from "src/MerkleAirdrop.sol";

contract DeployMerkleAirdrop is Script {
    bytes32 private s_merkleRoot =
        0xaa5d581231e596618465a56aa0f5870ba6e20785fe436d5bfb82b08662ccc7c4;
    uint256 private s_amountToAirdrop = 4 * 25 * 1e18;

    function deployMerkleAirdrop() public returns (MerkleAirdrop, TestToken) {
        vm.startBroadcast();
        TestToken token = new TestToken();
        MerkleAirdrop airdrop = new MerkleAirdrop(
            s_merkleRoot,
            IERC20(address(token))
        );
        token.mint(token.owner(), s_amountToAirdrop);
        token.transfer(address(airdrop), s_amountToAirdrop);
        vm.stopBroadcast();

        return (airdrop, token);
    }

    function run() external returns (MerkleAirdrop, TestToken) {
        return deployMerkleAirdrop();
    }
}
