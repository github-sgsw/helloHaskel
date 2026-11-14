module Chapter2Spec (tests) where

import Chapter2
import Test.Tasty
import Test.Tasty.HUnit

tests :: TestTree
tests =
  testGroup
    "Chapter 2 Tests"
    [ testCase "空でないリストの最後の要素を取り出す" $ myLast [1, 2, 3, 4, 5] @?= 5,
      testCase "空でないリストの最後の要素を取り除く" $ init1 [1, 2, 3, 4, 5] @?= [1, 2, 3, 4],
      testCase "空でないリストの最後の要素を取り除く" $ init2 [1, 2, 3, 4, 5] @?= [1, 2, 3, 4]
    ]
