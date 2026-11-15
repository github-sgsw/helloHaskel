module Chapter7 (
  altMap,
  luhn,
) where

-- 7.9 練習問題
-- 7.9.9
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap _ _ [] = []
altMap f1 f2 (x : xs) = f1 x : altMap f2 f1 xs

-- 7.9.10

-- | 数を2倍にして、結果が9より大きい場合に9を引く
luhnDouble :: Int -> Int
luhnDouble n
  | result > 9 = result - 9
  | otherwise = result
  where
    result = n * 2

-- | luhnアルゴリズム
-- 銀行のカード番号に対して単純な入力間違いを検出する
--
-- - それぞれを独立した番号だとみなす
-- - 右から数えて偶数番めの数すべてを二倍にする
-- - それぞれの数が 9 より大きいなら 9 を引く
-- - すべての数を足し合わせる
-- - 合計が 10 で割り切れるなら、カードの番号は正しい
luhn :: [Int] -> Bool
luhn ns = (sum $ altMap id luhnDouble (reverse ns)) `mod` 10 == 0
