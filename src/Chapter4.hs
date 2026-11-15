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

-- 4.8.1
halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-- 4.8.2
third :: [a] -> a
third [_, _, x] = x
third xs = head $ tail $ tail xs

-- 4.8.3
-- 4.8.3-a
safetail1 xs = if null xs then [] else tail xs

-- 4.8.3-b
safetail2 xs
  | null xs = []
  | otherwise = tail xs

-- 4.8.3-c
safetail3 [] = []
safetail3 (_ : xs) = xs

-- 4
-- 5
-- 4.8.7
mult :: Int -> Int -> Int -> Int
mult x y z = x * y * z

multlamda = \x -> \y -> \z -> x * y * z

-- 4.8.8

-- | 数を2倍にして、結果が9より大きい場合に9を引く
luhnDouble :: Int -> Int
luhnDouble n
  | result > 9 = result - 9
  | otherwise = result
  where
    result = n * 2

-- | luhnアルゴリズム
-- | 銀行のカード番号に対して単純な入力間違いを検出する
-- |
-- | ・それぞれを独立した番号だとみなす
-- | ・右から数えて偶数番めの数すべてを二倍にする
-- | ・それぞれの数が 9 より大きいなら 9 を引く
-- | ・すべての数を足し合わせる
-- | ・合計が 10 で割り切れるなら、カードの番号は正しい
luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d
  | (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0 = True
  | otherwise = False
