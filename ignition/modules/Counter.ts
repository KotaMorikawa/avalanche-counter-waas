// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const CounterModule = buildModule("CounterModule", (m) => {
  // Counterコントラクトはコンストラクタに引数が不要なので、空の配列を渡します
  const counter = m.contract("Counter", []);

  return { counter };
});

export default CounterModule;
