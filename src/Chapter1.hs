module Chapter1 (
  mySum,
  qsort,
  seqn,
  myDouble,
  myProduct,
) where

-- 1.5.1 数値を足し合わせる
mySum :: Num a => [a] -> a
mySum [] = 0
mySum (n : ns) = n + mySum ns

-- 1.5.2 数値を整列する
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x : xs) = qsort smaller ++ [x] ++ qsort larger
 where
  smaller = [a | a <- xs, a <= x]
  larger = [b | b <- xs, b > x]

-- 1.5.3 アクションを逐次に実行する
seqn :: Monad m => [m a] -> m [a]
seqn [] = return []
seqn (act : acts) = do
  x <- act
  xs <- seqn acts
  return (x : xs)

-- 1.7 練習問題
-- 1
myDouble :: Num a => a -> a
myDouble x = 2 * x

-- 2
-- 3
myProduct :: Num a => [a] -> a
myProduct [] = 1
myProduct (x : xs) = x * myProduct xs

-- 4
-- smaller, larger内のxによる大小判定を逆転させる

-- 5
-- 重複している数字がソート後のリストから1つになるように削除される
