// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Bank = await hre.ethers.getContractFactory("SmartBankAccount");
  const bank = await Bank.deploy();

  const deployedBank= await bank.deployed();

  //console.log("Greeter deployed to:", bank.address);
  //console.log(deployedBank) //lists all functions call and addresses
const getUser = await deployedBank.createUser("Eniola Agboola", 1);
const viewUser = await deployedBank.viewUser(1);
//const deposit = await deployedBank.Deposit(90);

console.log(viewUser)
//console.log(deposit)

}



// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
