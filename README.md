# Abstract 101
Learn how to build and deploy smart contracts on Abstract Chain.

### Prerequisites
 * [Git v2.0.0+](https://git-scm.com/downloads)
 * [Node.js v18.0.0+](https://nodejs.org/en/download/package-manager)

### 1. Checkout code
```sh
git clone https://github.com/diewland/abstract-101.git && cd abstract-101
```

### 2. Install dependencies
```sh
npm install
```
### 3. Create `.env` file
⚠️ DO NOT USE A PRIVATE KEY ASSOCIATED WITH REAL FUNDS. CREATE A NEW WALLET FOR THIS STEP.
```sh
PRIVATE_KEY='<YOUR-PRIVATE-KEY>'
```

### 4. Update wallet address on deploy script
`deploy/deploy.ts` line 22
```ts
19
20   // Deploy this contract. The returned object will be of a `Contract` type,
21   // similar to the ones in `ethers`.
22   const tokenContract = await deployer.deploy(artifact, [ "<YOUR-WALLET-ADDRESS>" ]);
23
```

### 5. Compile contract
```sh
npx hardhat compile --network abstractTestnet
```

### 6. Deploy contract
```sh
npx hardhat deploy-zksync --script deploy.ts --network abstractTestnet
```
output will be like this, `CONTRACT_ADDRESS` will be used in the next step
```sh
HelloABS was deployed to <CONTRACT_ADDRESS>
```

### 7. Verify contract
```sh
npx hardhat verify --network abstractTestnet <CONTRACT_ADDRESS> <YOUR-WALLET-ADDRESS>
```

### 8. Interact with contract
soon

### References
 * https://hardhat.org/hardhat-runner/docs/getting-started
 * https://docs.abs.xyz/build-on-abstract/smart-contracts/hardhat
