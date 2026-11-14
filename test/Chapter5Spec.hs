module Chapter5Spec (tests) where

import Chapter5
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "Chapter 5 Tests"
    [ testGroup
        "5.7.1 test1"
        [ testCase "1から100までの2乗の和" $ test1 3 @?= 14
        ],
      testGroup
        "5.7.2 grid"
        [ testCase "与えられた大きさの座標格子を返す" $ grid 1 2 @?= [(0, 0), (0, 1), (0, 2), (1, 0), (1, 1), (1, 2)]
        ],
      testGroup
        "5.7.3 square"
        [ testCase "大きさnの正方形座標を返す" $ square 2 @?= [(0, 1), (0, 2), (1, 0), (1, 2), (2, 0), (2, 1)]
        ],
      testGroup
        "5.7.4 myReplicate"
        [ testCase "ある要素からのみなるリストを生成する" $ myReplicate 3 True @?= [True, True, True]
        ],
      testGroup
        "5.7.5 pyths"
        [ testCase "与えられた上限以下のピタゴラス数の組を返す" $ pyths 10 @?= [(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10)]
        ],
      testGroup
        "5.7.6 perffects"
        [ testCase "与えられた上限までに含まれる全ての完全数を算出" $ perfects 500 @?= [6, 28, 496]
        ],
      testGroup
        "5.7.7 test7"
        [ testCase "2つのリスト内包表記を1つのリスト内包表記で表す" $ test7 @?= [(x, y) | x <- [1, 2, 3], y <- [4, 5, 6]]
        ]
    ]
