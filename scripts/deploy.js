const hre = require("hardhat");

async function main() {
  const BuyMeACoffee = await ethers.getContractFactory("BuyMeACoffee");
  const buyMeACoffee = await BuyMeACoffee.deploy();
  // Deploy the contract.
  await buyMeACoffee.waitForDeployment();
  console.log("BuyMeACoffee deployed to:", await buyMeACoffee.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
