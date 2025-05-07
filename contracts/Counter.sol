// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Counter {
    uint256 public count; // カウントを保存する符号なし整数型の状態変数

    // コンストラクタ（デプロイ時に一度だけ実行される）
    constructor() {
        count = 0; // カウントを0で初期化
    }

    // カウントをインクリメントする関数
    function increment() public {
        count += 1;
    }

    // カウントをデクリメントする関数
    // requireを使って、カウントが0未満にならないように制限
    function decrement() public {
        require(count > 0, "Count cannot be less than zero.");
        count -= 1;
    }

    // 現在のカウントを取得する関数 (publicな状態変数は自動的にゲッター関数が作成されるため、明示的なゲッターは必須ではありませんが、例として記述します)
    function getCount() public view returns (uint256) {
        return count;
    }
}
