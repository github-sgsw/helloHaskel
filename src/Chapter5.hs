module Chapter5 (
  test1,
  grid,
  square,
  myReplicate,
  pyths,
  perfects,
  test7,
) where

-- 5.2 ガード
factors :: Int -> [Int]
factors n = [x | x <- [1 .. n], n `mod` x == 0]

-- | 指定したkeyと同じkeyを持つ組から値を取り出してリストにする
find :: Eq a => a -> [(a, b)] -> [b]
find k t = [v | (k', v) <- t, k == k']

-- 5.3 zip関数

-- | 指定した値が含まれる位置を返す
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0 ..], x == x']

-- 5.7 練習問題
-- 1 (テストがしやすいように与えられた値までの和に改変)
test1 :: Int -> Int
test1 n = sum [num ^ 2 | num <- [1 .. n]]

-- 2
grid :: Int -> Int -> [(Int, Int)]
grid m n = [(x, y) | x <- [0 .. m], y <- [0 .. n]]

-- 3:
square :: Int -> [(Int, Int)]
square n = [(x, y) | (x, y) <- grid n n, x /= y]

-- 4
myReplicate :: Int -> a -> [a]
myReplicate n a = [a | _ <- [1 .. n]]

-- 5
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1 .. n], y <- [1 .. n], z <- [1 .. n], x ^ 2 + y ^ 2 == z ^ 2]

-- 6
perfects :: Int -> [Int]
perfects n = [x | x <- [1 .. n], (sum $ factors x) - x == x]

-- 7
test7 :: [(Int, Int)]
test7 = concat [[(x, y) | y <- [4, 5, 6]] | x <- [1, 2, 3]]

-- 8
-- 9
-- 10
