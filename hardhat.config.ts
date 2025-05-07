import type { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";
import "@nomicfoundation/hardhat-foundry";
import * as dotenv from "dotenv";

// .envファイルを読み込む
dotenv.config();

// 環境変数が存在しない場合のデフォルト値
const PRIVATE_KEY = process.env.PRIVATE_KEY || "";
const FUJI_RPC_URL = "https://api.avax-test.network/ext/bc/C/rpc";

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  // avalancheのtestnetを使用するための設定
  networks: {
    fuji: {
      url: FUJI_RPC_URL,
      accounts: PRIVATE_KEY ? [PRIVATE_KEY] : [],
    },
  },
};

export default config;
