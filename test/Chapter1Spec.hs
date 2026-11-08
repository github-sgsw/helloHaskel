module Chapter1Spec (tests) where

import Chapter1 (myDouble, myProduct, qsort)
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "Chapter 1 Tests"
    [ testCase "降順ソート" $
        qsort [2, 2, 3, 1, 1] @?= [1, 1, 2, 2, 3],
      testCase "与えられた数値の2倍" $
        myDouble 4 @?= 8,
      testCase "与えられたリスト内の数値の積" $
        myProduct [1, 2, 3, 4] @?= 24
    ]
