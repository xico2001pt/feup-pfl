---------------  HO-3  ---------------
-- a)
applyN :: Integral n => (a -> a) -> n -> a -> a
applyN _ 0 x = x
applyN f n x
    | n > 0 = f (applyN f (n-1) x)
    | otherwise = error "Negative number"

-- b)
cipher :: (Integral n) => n -> [Char] -> [Char]
cipher _ [] = []
cipher n (x:xs) = applyN nextChar n x:cipher n xs

nextChar :: Char -> Char
nextChar 'z' = 'a'
nextChar c = succ c

---------------  HO-8  ---------------
myFlip :: (a -> b -> c) -> b -> a -> c
myFlip f = \a b -> f b a

---------------  HO-10  ---------------
myUncurry :: (a -> b -> c) -> (a, b) -> c
myUncurry f (a, b) = f a b

---------------  HO-16  ---------------
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x:xs)
    | f x = x:myFilter f xs
    | otherwise = myFilter f xs

---------------  HO-32  ---------------
myMap :: (a -> b) -> [a] -> [b]
myMap f l = foldr (\x acc -> (f x):acc) [] l

---------------  HO-48  ---------------
myLast :: [a] -> a
myLast = head . reverse