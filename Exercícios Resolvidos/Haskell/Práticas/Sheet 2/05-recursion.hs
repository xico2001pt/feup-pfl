---------------  Ex 2.10  ---------------
-- a)
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && (and' xs)

-- b)
or' :: [Bool] -> Bool
or' [] = False
or' (x:xs) = x || (or' xs)

-- c)
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs

-- d)
replicate' :: Int -> a -> [a]
replicate' n x = x:(replicate (n-1) x)

--e)
(!!!) :: [a] -> Int -> a
(!!!) (x:_) 0 = x
(!!!) [] i = error "index too large"
(!!!) (_:l) i = l !!! (i-1)

--f)
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs) = (a == x) || elem a xs

---------------  Ex 2.12  ---------------
-- forte :: String -> Bool
-- forte str = and [length str > 8, any isLower str, any isUpper str, any isDigit str]

---------------  Ex 2.13  ---------------
-- a)
mindiv :: Int -> Int
mindiv n = [x | x <- [1..(n-1)], n `mod` x == 0] !! 0

-- b)
primo' :: Int -> Bool
primo' n = n > 1 && mindiv n == n

---------------  Ex 2.14  ---------------
nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) = if elem x res then res else x:res
    where res = nub xs

---------------  Ex 2.15  ---------------
intersperse' :: a -> [a] -> [a]
intersperse' _ [] = []
intersperse' _ [x] = [x]
intersperse' c (x:xs) = x:c:intersperse' c xs

---------------  Ex 2.16  ---------------
algarismos :: Int -> [Int]
algarismos 0 = []
algarismos n = algarismos (n `div` 10) ++ [n `mod` 10]

---------------  Ex 2.17  ---------------
toBits :: Int -> [Int]
toBits 0 = []
toBits n = toBits (n `div` 2) ++ [n `mod` 2]

---------------  Ex 2.18  ---------------
fromBits :: [Int] -> Int
fromBits [] = 0
fromBits (x:xs) = (x * 2^length xs) + fromBits xs

---------------  Ex 2.19  ---------------
mdc :: Integer -> Integer -> Integer
mdc a 0 = a
mdc a b = mdc b (a `mod` b)

---------------  Ex 2.20  ---------------
-- a)
insert' :: Ord a => a -> [a] -> [a]
insert' i [] = [i]
insert' i (x:xs)
    | i <= x = i:x:xs
    | otherwise = x:insert' i xs

-- b)
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert' x (isort xs)

---------------  Ex 2.21  ---------------
-- a)
minimum' :: Ord a => [a] -> a
minimum' [] = error "Empty list"
minimum' [x] = x
minimum' (x:xs) =
    if x < min then x else min
    where min = minimum' xs

-- b)
delete' :: Eq a => a -> [a] -> [a]
delete' i [] = []
delete' i (x:xs) = if i == x then xs else x:delete' i xs

-- c)
ssort :: Ord a => [a] -> [a]
ssort [] = []
ssort l =
    m:ssort (delete' m l)
    where m = minimum' l

---------------  Ex 2.22  ---------------
-- a)
merge :: Ord a => [a] -> [a] -> [a]
merge [] b = b
merge a [] = a
merge (a:as) (b:bs)
    | a < b = a:merge as (b:bs)
    | otherwise = b:merge (a:as) bs

-- b)
metades :: [a] -> ([a], [a])
metades l =
    (take half l, drop half l)
    where half = length l `div` 2

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort l =
    merge (msort a) (msort b)
    where (a, b) = metades l

---------------  Ex 2.23  ---------------
-- a)
addPoly :: [Int] -> [Int] -> [Int]
addPoly [] b = b
addPoly a [] = a
addPoly (a:as) (b:bs) = (a+b):addPoly as bs

-- b)
multPoly :: [Int] -> [Int] -> [Int]
multPoly [] _ = [0]
multPoly _ [] = [0]
multPoly xs ys = addPoly (map (*(head xs)) ys) (0 : (multPoly (tail xs) ys))