module Chapter2 (
  myLast,
  init1,
  init2,
) where

double x = x + x

quadruple x = double (double x)

factorial n = product [1 .. n]

average ns = sum ns `div` length ns

-- 2.7 練習問題
-- 2
-- (2 ^ 3) * 4
-- (2 * 3) + (4 * 5)
-- 2 + (3 * (4 ^ 5))

-- 3
test3 :: Int
test3 = a `div` length xs
  where
    a = 10
    xs = [1, 2, 3, 4, 5]

-- 4
myLast :: [x] -> x
myLast xs = head $ reverse xs

-- 5
init1 :: [xs] -> [xs]
init1 xs = reverse $ drop 1 $ reverse xs

init2 :: [xs] -> [xs]
init2 xs = take (length xs - 1) xs
