module Chapter6 (
  sumdown,
  euclid,
  myAnd,
  myConcat,
  myReplicate,
  (!!!),
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
  | y == 0 = x
  | x > y = euclid (x - y) y
  | y > x = euclid (y - x) x
  | otherwise = x

-- 5

-- 6
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (b : bs) = if b then myAnd bs else b

myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (x : xs) = x ++ myConcat xs

myReplicate :: Int -> a -> [a]
myReplicate n a
  | n > 0 = a : myReplicate (n - 1) a
  | otherwise = []

(!!!) :: [a] -> Int -> a
(!!!) (x : _) 0 = x
(!!!) (_ : xs) n = xs !!! (n - 1)
