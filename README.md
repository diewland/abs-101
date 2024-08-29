# Abstract 101
Learn how to build and deploy smart contracts on Abstract Chain.

### Prerequisites
 * [Git v2.0.0+](https://git-scm.com/downloads)
 * [Node.js v18.0.0+](https://nodejs.org/en/download/package-manager)

### 1. Checkout code
```
git clone https://github.com/diewland/abstract-101.git && cd abstract-101
```

### 2. Install dependencies
```
npm install
```

### 3. Compile contract
```
npx hardhat compile --network abstractTestnet
```

*** add .env !!! BEFORE PRIVATE KEY !!!
*** edit deployer address in deploy.ts ***

### 4. Deploy contract
```
npx hardhat deploy-zksync --script deploy.ts --network abstractTestnet
```
output will display as
```
HelloABS was deployed to <CONTRACT_ADDRESS>
```

*** keep contract, deployer address in next step ***

### 5. Verify contract
```
npx hardhat verify --network abstractTestnet <CONTRACT_ADDRESS> <DEPLOYER_ADDRESS>
```

*** NEXT: interact with contract ***

### References
 * https://hardhat.org/hardhat-runner/docs/getting-started
 * https://docs.abs.xyz/build-on-abstract/smart-contracts/hardhat
