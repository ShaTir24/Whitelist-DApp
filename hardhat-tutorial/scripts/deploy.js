const { ethers } = require("hardhat");

async function main() {
  //contract factory in ethers.js is an abstraction used to deploy new smart contracts
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  //deploying the contract
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  //10 is max number of whitelisted allowed

  await deployedWhitelistContract.deployed();
  //waiting untill deploying is finished

  console.log("Whitelist Contract Address: ", deployedWhitelistContract.address);
  //printing the address of generated contract through transaction
}

//calling the main function with error checking
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });