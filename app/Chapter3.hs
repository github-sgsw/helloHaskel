-- 3.11 練習問題

-- 1
-- ['a', 'b', 'c'] :: [Char]
-- ('a', 'b', 'c') :: (Char, Char, Char)
-- [(False, '0'), (True, '1')] :: [(Bool, Char)]
-- ([False, True], ['0', '1']) :: ([Bool], [Char])
-- [tail, init, reverse] :: [[a] -> [a]]

-- 2
-- bools = [True, False]
-- nums = [[1, 2], [3, 4], [5, 6]]
-- add a b c= a + b + c
-- copy a = (a, a)
-- apply a = f a

-- 3
-- [x] -> x
-- (x, y) -> (y, x)
-- x -> y -> (x, y)
-- Num a => a -> a
-- Eq a => [a] -> Bool
-- (t -> t) -> t -> t
