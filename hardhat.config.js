require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ethers");
require("dotenv").config();

const ARBITRUM_URL = process.env.ARBITRUM_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    arbitrum: {
      url: ARBITRUM_URL,
      accounts: [PRIVATE_KEY],
    },
  },
};
