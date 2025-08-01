
# Merkle Airdrop Smart Contract

A lightweight Solidity smart contract for securely and efficiently distributing tokens using a Merkle Tree. This contract allows eligible recipients to claim their tokens by providing a valid Merkle proof.

## 🧾 Features

- Gas-efficient airdrop distribution
- Verifies claims via Merkle proofs
- Prevents double-claims
- Owner-controlled Merkle root
- Supports ERC-20 token airdrops

---

## 🔧 Requirements

- Solidity ^0.8.0
- ERC-20 compatible token contract

---

## 📦 Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/small-merkle-airdrop.git
cd small-merkle-airdrop
````

Install dependencies (if using Hardhat):

```bash
npm install
```

---

## 🛠️ Usage

### 1. Deploy Contract

The contract requires the address of the ERC-20 token and the Merkle root:

```solidity
constructor(address airdropToken, bytes32 merkleRoot)
```

You can generate the Merkle root off-chain using tools like [merkletreejs](https://github.com/miguelmota/merkletreejs).

### 2. Claim Tokens

Users can claim their airdrop using:

```solidity
function claim(uint256 amount, bytes32[] calldata merkleProof) external
```

The contract will verify:

* The user hasn't already claimed.
* The provided proof is valid for the sender and amount.

### 3. Update Merkle Root (Owner only)

```solidity
function updateMerkleRoot(bytes32 newRoot) external onlyOwner
```

---

## 🧪 Testing

To run the tests:

```bash
forge test -vvvv
```

Make sure your test files cover:

* Successful claim
* Invalid proof rejection
* Double claim prevention
* Admin update of Merkle root

---

## 🔐 Security Notes

* Only use trusted Merkle proof generators.
* Ensure token approvals and ownership are correctly managed.
* Audit before deploying on mainnet.

---

## 📄 License

MIT License

---

## 👨‍💻 Author

Developed by Nkh000
from Cyfrin updraft course
---

```
