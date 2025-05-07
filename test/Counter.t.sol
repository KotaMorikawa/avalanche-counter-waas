// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "lib/forge-std/src/Test.sol";
import {Counter} from "../contracts/Counter.sol";

contract CounterTest is Test {
    // テスト対象のCounterコントラクトをインスタンス化
    Counter public counter;

    // 各テスト実行前に呼ばれるセットアップ関数
    function setUp() public {
        counter = new Counter();
    }

    // 初期状態のテスト
    function testInitialCount() public view {
        assertEq(counter.count(), 0, "Initial count should be 0");
    }

    // インクリメント関数のテスト
    function testIncrement() public {
        counter.increment();
        assertEq(counter.count(), 1, "Count should be 1 after increment");

        counter.increment();
        assertEq(
            counter.count(),
            2,
            "Count should be 2 after second increment"
        );
    }

    // デクリメント関数のテスト
    function testDecrement() public {
        // 最初にインクリメントしてからデクリメントをテスト
        counter.increment();
        counter.increment();
        assertEq(counter.count(), 2, "Count should be 2 before decrement");

        counter.decrement();
        assertEq(counter.count(), 1, "Count should be 1 after decrement");
    }

    // getCount関数のテスト
    function testGetCount() public {
        assertEq(counter.getCount(), 0, "getCount should return 0 initially");

        counter.increment();
        assertEq(
            counter.getCount(),
            1,
            "getCount should return 1 after increment"
        );
    }

    // 0未満にならないことを確認するテスト（失敗ケース）
    function testFailDecrementBelowZero() public {
        // この関数は失敗することが期待される
        counter.decrement(); // カウントが0の状態でデクリメントすると失敗するはず
    }

    // 0未満にならないことを確認するテスト（vm.expectRevertを使用）
    function testDecrementBelowZeroReverts() public {
        // 特定のエラーメッセージで失敗することを期待
        vm.expectRevert("Count cannot be less than zero.");
        counter.decrement();
    }
}
