module Main where

import qualified Chapter1Spec
import qualified Chapter2Spec
import qualified Chapter4Spec
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "All Chapters Tests"
    [ Chapter1Spec.tests,
      Chapter2Spec.tests,
      Chapter4Spec.tests
    ]
