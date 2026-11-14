module Chapter6 (
  sumdown,
  euclid,
  myAnd,
  myConcat,
  myReplicate,
  (!!!),
  myElem,
) where

-- 6.8 練習問題
-- 6.8.1

-- 6.8.2
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n - 1)

-- 6.8.4
euclid :: Int -> Int -> Int
euclid x y
  | y == 0 = x
  | x > y = euclid (x - y) y
  | y > x = euclid (y - x) x
  | otherwise = x

-- 6.8.5

-- 6.8.6
-- 6.8.6-a
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (b : bs) = if b then myAnd bs else b

-- 6.8.6-b
myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (x : xs) = x ++ myConcat xs

-- 6.8.6-c
myReplicate :: Int -> a -> [a]
myReplicate n a
  | n > 0 = a : myReplicate (n - 1) a
  | otherwise = []

-- 6.8.6-d
(!!!) :: [a] -> Int -> a
(!!!) (x : _) 0 = x
(!!!) (_ : xs) n = xs !!! (n - 1)

-- 6.8.6-e
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x : xs)
  | a == x = True
  | otherwise = myElem a xs
