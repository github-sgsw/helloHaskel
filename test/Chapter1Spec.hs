-- test/Chapter1Spec.hs
module Chapter1Spec (tests) where

import Chapter1 (myDouble, myProduct, qsort)
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "Chapter 1 Tests"
    [ testCase "qsort sorts a list correctly" $
        qsort [2, 2, 3, 1, 1] @?= [1, 1, 2, 2, 3],
      testCase "myDouble doubles a number" $
        myDouble 4 @?= 8,
      testCase "myProduct multiplies all elements" $
        myProduct [1, 2, 3, 4] @?= 24
    ]
