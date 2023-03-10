import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  networks: {
    matic: {
      url: "https://polygon-rpc.com", // Replace with the RPC endpoint for your desired network (Mumbai Testnet in this example)
      accounts: [
        "6d98e6f8bc1205c8e4ebe77a715d70f0cce986dde5630af4f74858425da5f247",
      ],
      chainId: 137,
    },
  },
  etherscan: {
    apiKey: "PNIPM91AZ6B8CWNSIUHGNBC8S31THZGGVK",
    // apiKey: "3GND43EEVWQFZ9GSZVSSMV68PUIPJKDD8D",
  },
  solidity: "0.8.9",
};

export default config;
