module Chapter7Spec (tests) where

import Chapter7
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "Chapter 7 Tests"
    [ testGroup
        "7.9.9 altMap"
        [ testCase "引数で指定された2つの関数をリストの要素に交互に適用" $ altMap (+ 10) (+ 100) [0, 1, 2, 3, 4] @?= [10, 101, 12, 103, 14],
          testCase "要素数1つ" $ altMap (+ 10) (+ 100) [1] @?= [11],
          testCase "空リスト" $ altMap (+ 10) (+ 100) [] @?= []
        ],
      testGroup
        "7.9.10 luhnアルゴリズム"
        [ testCase "有効なカード番号" $ luhn [7, 9, 9, 2, 7, 3, 9, 8, 7, 1, 3] @?= True,
          testCase "無効なカード番号" $ luhn [7, 9, 9, 2, 7, 3, 9, 8, 7, 1, 4] @?= False,
          testCase "全ての要素が0のリスト" $ luhn [0, 0, 0, 0] @?= True,
          testCase "空リスト" $ luhn [] @?= True
        ]
    ]
