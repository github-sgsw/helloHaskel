module Main where

import qualified Chapter1Spec
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "All Chapters Tests"
    [ Chapter1Spec.tests
    ]
