# Avalanche Counter WaaS (Web3 as a Service)

シンプルなブロックチェーンカウンターアプリケーションのスマートコントラクト部分です。Avalanche ブロックチェーン上で動作するカウンター機能を提供します。

## プロジェクト概要

このプロジェクトは、Solidity 言語で書かれたシンプルなカウンタースマートコントラクトを実装しています。

- カウンターの増加（increment）
- カウンターの減少（decrement）- 0 未満にはならないよう制限あり
- 現在の値の取得（getCount）

開発環境としては Hardhat と Foundry を使用しており、デプロイには Hardhat Ignition を使用しています。

## 技術スタック

- Solidity: ^0.8.19
- Hardhat: スマートコントラクトの開発・テスト・デプロイフレームワーク
- Foundry: 高速なスマートコントラクトテスト環境
- Hardhat Ignition: スマートコントラクトデプロイ管理

## セットアップ手順

1. リポジトリをクローン:

```bash
git clone <repository-url>
cd avalanche-counter-waas
```

2. 依存パッケージをインストール:

```bash
npm install
```

3. コントラクトをコンパイル:

```bash
npx hardhat compile
```

4. テストを実行:

```bash
# Hardhatテストの場合
npx hardhat test

# Foundryテストの場合
forge test
```

## デプロイ

Avalanche テストネット（Fuji）へのデプロイ:

```bash
npx hardhat ignition deploy ./ignition/modules/Counter.ts --network fuji
```

デプロイされたコントラクトアドレスは `ignition/deployments/` ディレクトリに保存されます。

## コントラクト構造

`Counter.sol`は以下の機能を提供します:

- `increment()`: カウンターを 1 増加させる
- `decrement()`: カウンターを 1 減少させる（0 未満にはならない）
- `getCount()`: 現在のカウント値を取得する

## ライセンス

MIT
