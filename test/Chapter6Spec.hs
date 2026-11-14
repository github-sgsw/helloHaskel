module Chapter6Spec (tests) where

import Chapter6
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "Chapter 6 Tests"
    [ testGroup
        "6.8.2 sumdown"
        [ testCase "与えられた非負の整数から0までを足し合わせる" $ sumdown 3 @?= 6,
          testCase "0の場合（終了条件の確認）" $ sumdown 0 @?= 0
        ],
      testGroup
        "6.8.4 euclid"
        [ testCase "2つの非負の整数に対する最大公約数を計算" $ euclid 6 27 @?= 3,
          testCase "2つの非負の整数に対する最大公約数を計算（0が含まれている場合）" $ euclid 0 5 @?= 5
        ],
      testGroup
        "6.8.6 プレリュード関数を再起で再定義"
        [ testGroup
            "6.8.6-a and リストの要素が全てTrueか検査"
            [ testCase "正常系" $ myAnd [True, True, True] @?= True,
              testCase "Falseが含まれる場合" $ myAnd [False, True, True] @?= False,
              testCase "空配列" $ myAnd [] @?= True
            ],
          testGroup
            "6.8.6-b concat リストのリストを取り、要素であるリストを連結する関数"
            [ testCase "正常系" $ myConcat [[1, 2, 3], [4, 5, 6]] @?= [1, 2, 3, 4, 5, 6],
              testCase "空配列" $ myConcat ([] :: [[Int]]) @?= [],
              testCase "要素数が違う" $ myConcat [[1, 2, 3], [4, 5, 6, 7]] @?= [1, 2, 3, 4, 5, 6, 7],
              testCase "途中に空配列" $ myConcat [[], [1, 2], [], [3], [4, 5]] @?= [1, 2, 3, 4, 5]
            ],
          testGroup
            "6.8.6-c replicate 指定された要素をn個持つリストを生成"
            [ testCase "正常系" $ myReplicate 3 True @?= [True, True, True],
              testCase "指定された要素が0" $ myReplicate 0 True @?= [],
              testCase "負数の指定" $ myReplicate (-1) True @?= []
            ],
          testGroup
            "6.8.6-d (!!) 空でないリストのn番目の要素を取り出す"
            [ testCase "正常系" $ ([1, 2, 3] !!! 2) @?= 3
            ],
          testGroup
            "6.8.6-e myElem リストの要素に含まれるか検査する関数"
            [ testCase "Int 含まれている" $ myElem 3 [1, 2, 3] @?= True,
              testCase "Int 含まれていない" $ myElem 4 [1, 2, 3] @?= False,
              testCase "空配列" $ myElem True [] @?= False,
              testCase "Char 含まれている" $ myElem 'c' "haskell" @?= False,
              testCase "Char 含まれていない" $ myElem 'e' "haskell" @?= True
            ]
        ],
      testGroup
        "6.8.7 merge 整列されたリストを2つ取り、1つの整列されたリストにして返す"
        [ testCase "正常系" $ merge [2, 5, 6] [1, 3, 4] @?= [1, 2, 3, 4, 5, 6],
          testCase "空配列 1" $ merge [] [5, 6, 7] @?= [5, 6, 7],
          testCase "空配列 2" $ merge [8, 9, 10] [] @?= [8, 9, 10]
        ]
    ]
