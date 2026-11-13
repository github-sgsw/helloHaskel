module Chapter6 (
  sumdown,
  euclid,
  myAnd,
  myConcat,
  myReplicate,
) where

-- 6.8 練習問題
-- 1

-- 2
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n - 1)

-- 4
euclid :: Int -> Int -> Int
euclid x y
  | x > y = euclid (x - y) y
  | y > x = euclid (y - x) x
  | x == y = x

-- 5

-- 6
myAnd :: [Bool] -> Bool
myAnd = undefined

myConcat :: [[a]] -> [a]
myConcat = undefined

myReplicate :: Int -> a -> [a]
myReplicate = undefined
