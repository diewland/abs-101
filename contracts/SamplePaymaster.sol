// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./IPaymaster.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/***
 * A sample Paymaster contract to be deployed on Abstract testnet.
 * This Paymaster blindly sponsors the gas for any user attempting to mint an NFT from 0xC4822AbB9F05646A9Ce44EFa6dDcda0Bf45595AA.
 * This code is heavily inspired from: https://github.com/alchemyplatform/zksync-paymaster-example/blob/main/contracts/Paymaster.sol
 */
contract SamplePaymaster is IPaymaster, Ownable {
    address constant BOOTLOADER = address(0x8001);
    address public targetAddress;

    constructor(address initialOwner) Ownable(initialOwner) {}

    function validateAndPayForPaymasterTransaction(
        bytes32,
        bytes32,
        Transaction calldata _transaction
    ) external payable returns (bytes4 magic, bytes memory context) {
        require(
            msg.sender == BOOTLOADER,
            "Only the Bootloader can call this function"
        );

        require(
            address(uint160(_transaction.to)) == targetAddress,
            "Transaction must call whitelisted NFT contract"
        );

        context = "";
        magic = PAYMASTER_VALIDATION_SUCCESS_MAGIC;

        uint requiredETH = _transaction.gasLimit * _transaction.maxFeePerGas;

        (bool success, ) = BOOTLOADER.call{value: requiredETH}("");
        require(success, "Bootloader call failed");
    }

    function setTarget(address _addr) external onlyOwner {
        targetAddress = _addr;
    }

    function withdraw() external onlyOwner returns (bool) {
        uint256 balance = address(this).balance;
        (bool success, ) = payable(msg.sender).call{value: balance}("");
        return success;
    }

    receive() external payable {}
}
