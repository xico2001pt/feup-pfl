---------------  Ex 3.1  ---------------
ex31 :: (a -> b) -> [a] -> (a -> Bool) -> [b]
ex31 f l p = map f (filter p l)

---------------  Ex 3.2  ---------------
dec2int :: [Int] -> Int
dec2int l = foldl (\a b -> 10*a+b) 0 l

---------------  Ex 3.3  ---------------
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y:zipWith' f xs ys

---------------  Ex 3.5  ---------------
-- a)
maximum' :: Ord a => [a] -> a
maximum' l = foldl1 max l

minimum' :: Ord a => [a] -> a
minimum' l = foldr1 min l

---------------  Ex 3.6  ---------------
mdc :: Int -> Int -> Int
mdc a b = fst (until (\(x, y) -> y == 0) (\(x, y) -> (y, x `mod` y)) (a, b))

---------------  Ex 3.7  ---------------
-- a)
(+++) :: [a] -> [a] -> [a]
(+++) a b = foldr (:) b a

-- b)
concat' :: [[a]] -> [a]
concat' l = foldl (++) [] l

---------------  Ex 3.8  ---------------
-- a)
palavras :: String -> [String]
palavras s = foldr (\x (y:ys) -> if x == ' ' then []:(y:ys) else (x:y):ys) [""] s

-- b)
despalavras :: [String] -> String
despalavras l = foldr1 (\x y -> (x ++ " ") ++ y) l