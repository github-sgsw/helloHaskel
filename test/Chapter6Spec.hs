module Chapter6Spec (tests) where

import Chapter6
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "Chapter 6 Tests"
    [ testGroup
        "2. sumdown"
        [ testCase "与えられた非負の整数から0までを足し合わせる" $
            sumdown 3 @?= 6
        ],
      testGroup
        "4. euclid"
        [ testCase "2つの非負の整数に対する最大公約数を計算" $
            euclid 6 27 @?= 3
        ],
      testGroup
        "6. プレリュード関数を再起で再定義"
        [ testCase "リストの要素が全てTrueか検査 -- and" $
            myAnd [True, True, True] @?= True,
          testCase "リストの要素が全てTrueか検査 (Falseが含まれる場合) -- and" $
            myAnd [False, True, True] @?= False,
          testCase "リストのリストを取り、要素であるリストを連結する -- concat" $
            myConcat [[1, 2, 3], [4, 5, 6]] @?= [1, 2, 3, 4, 5, 6],
          testCase "指定された要素をn個持つリストを生成 -- replicate" $
            myReplicate 3 True @?= [True, True, True]
        ]
    ]
