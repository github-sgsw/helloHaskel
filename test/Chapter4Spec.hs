module Chapter4Spec (tests) where

import Chapter4
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "Chapter 4 Tests"
    [ testGroup
        "4.8.1 halve"
        [ testCase "長さが偶数のリストを半分ずつに分割する" $ halve [1, 2, 3, 4, 5, 6] @?= ([1, 2, 3], [4, 5, 6])
        ],
      testGroup
        "4.8.2 third"
        [ testCase "リストの3つめの要素を返す" $ third [1, 2, 3, 4, 5] @?= 3
        ],
      testGroup
        "4.8.3 safetail (1〜3)"
        [ testCase "safetail1: リストから先頭の要素を取り除く" $ safetail1 [1, 2, 3, 4, 5] @?= [2, 3, 4, 5],
          testCase "safetail1: 空リストを渡された時は空リストを返す" $ safetail1 ([] :: [Int]) @?= ([] :: [Int]),
          testCase "safetail2: リストから先頭の要素を取り除く" $ safetail2 [1, 2, 3, 4, 5] @?= [2, 3, 4, 5],
          testCase "safetail2: 空リストを渡された時は空リストを返す" $ safetail2 ([] :: [Int]) @?= ([] :: [Int]),
          testCase "safetail3: リストから先頭の要素を取り除く" $ safetail3 [1, 2, 3, 4, 5] @?= [2, 3, 4, 5],
          testCase "safetail3: 空リストを渡された時は空リストを返す" $ safetail3 ([] :: [Int]) @?= ([] :: [Int])
        ],
      testGroup
        "4.8.8 luhnDouble & luhn"
        [ testCase "luhnDouble: 9より大きくなる場合 (3 -> 6)" $ luhnDouble 3 @?= 6,
          testCase "luhnDouble: 9を超えない場合 (6 -> 3)" $ luhnDouble 6 @?= 3,
          testCase "luhn: 正しいカード番号" $ luhn 1 7 8 4 @?= True,
          testCase "luhn: 間違ったカード番号" $ luhn 4 7 8 3 @?= False
        ]
    ]
