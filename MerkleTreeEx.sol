//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract MerkleTreeExample {
    bytes32 public merkleRoot = 0x3cd2b2fce2900990c8e8e808384cf741c007a94a1912df6d1ff73015ddb359a3;

    //3cd2b2fce2900990c8e8e808384cf741c007a94a1912df6d1ff73015ddb359a3

    mapping(address => bool) public whiteListClaimed;

    function whiteListMint(bytes32[] memory _merkleProof) public {
        require(!whiteListClaimed[msg.sender], "Address already claimed");

        bytes32 leaf = keccak256(abi.encode(msg.sender));

        require(MerkleProof.verify(_merkleProof, merkleRoot, leaf), "Invalid Merkle");

        whiteListClaimed[msg.sender] = true;
    }
}
