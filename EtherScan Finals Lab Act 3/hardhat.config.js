/**
 * @type import('hardhat/config'). HardhatUserConfig
 */
require("dotenv").config();
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

const { API_URL, PRIVATE_KEY } = process.env;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

module.exports = {
  solidity: "0.8.3",
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {},
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/HlG40tCRYv3pMeXg-gn8ahTu4gjd-vVq",
      accounts: [
        `0x${"c645e0556ed9f3aa9762bbc5384f3b6b8af8ea664a14ce7c858903401dafe704"}`,
      ],
    },
  },
  etherscan: {
    // API key for Etherscan
    apiKey: ETHERSCAN_API_KEY,
  },
};
