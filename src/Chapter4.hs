module Chapter4 (
  halve,
  third,
  safetail1,
  safetail2,
  safetail3,
  mult,
  multlamda,
  luhnDouble,
  luhn,
) where

-- 4.8 練習問題

-- 1
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-- 2
third :: [a] -> a
third [_, _, x] = x
third xs = head $ tail $ tail xs

-- 3
-- a
safetail1 xs = if null xs then [] else tail xs

--
safetail2 xs
  | null xs = []
  | otherwise = tail xs

-- c
safetail3 [] = []
safetail3 (_ : xs) = xs

-- 4
-- 5
-- 6

-- 7
mult :: Int -> Int -> Int -> Int
mult x y z = x * y * z

multlamda = \x -> \y -> \z -> x * y * z

-- 8
luhnDouble :: Int -> Int
luhnDouble n
  | result > 9 = result - 9
  | otherwise = result
  where
    result = n * 2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d
  | (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0 = True
  | otherwise = False
