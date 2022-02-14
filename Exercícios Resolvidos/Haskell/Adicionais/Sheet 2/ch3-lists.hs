import Data.List

---------------  LI-13  ---------------
mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt _ [] = ([], [])
mySplitAt 0 l = ([], l)
mySplitAt n (x:xs) =
    (x:a, b)
    where (a, b) = mySplitAt (n-1) xs

---------------  LI-14  ---------------
myGroup :: Eq a => [a] -> [[a]]
myGroup [] = []
myGroup [x] = [[x]]
myGroup (x:y:xs)
    | x == y = (x:z):zs
    | otherwise = [x]:z:zs
    where (z:zs) = myGroup (y:xs)

---------------  LI-15  ---------------
-- a)
myInits :: [a] -> [[a]]
myInits [] = [[]]
myInits l = myInits (init l) ++ [l]

-- b)
myTails :: [a] -> [[a]]
myTails [] = [[]]
myTails l = l : myTails (tail l)

---------------  LI-16  ---------------
-- a)
myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (a:as) (b:bs) = (a, b):myZip as bs

-- b)
myZip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
myZip3 [] _ _ = []
myZip3 _ [] _ = []
myZip3 _ _ [] = []
myZip3 (a:as) (b:bs) (c:cs) = (a, b, c):myZip3 as bs cs

---------------  LI-17  ---------------
differentFromNext :: Eq a => [a] -> [a]
differentFromNext [] = []
differentFromNext [a] = []
differentFromNext (a:b:as) =
    if a /= b then a:xs
    else xs
    where xs = differentFromNext (b:as)

---------------  LI-18  ---------------
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose m =
    hs:myTranspose ts
    where (hs,ts) = splitHeadsTails m

splitHeadsTails :: [[a]] -> ([a], [[a]])
splitHeadsTails [] = ([],[])
splitHeadsTails (ys:xs) =
    case ys of
        [] -> (hs,ts)
        [z] -> (z:hs,ts)
        (z:zs) -> (z:hs,zs:ts)
    where (hs,ts) = splitHeadsTails xs

---------------  LI-31  ---------------
differentFromNext' :: Eq a => [a] -> [a]
differentFromNext' l = [x | (x, y) <- zip l (tail l), x /= y]

---------------  LI-32  ---------------
conseqPairs :: [a] -> [(a, a)]
conseqPairs l = zip l (tail l)

---------------  LI-33  ---------------
myZip3' :: [a] -> [b] -> [c] -> [(a, b, c)]
myZip3' a b c = [(x, y, z) | (x, (y, z)) <- zip a (zip b c)]

---------------  LI-35  ---------------
checkMod3ThenOdd :: [Int] -> Bool
checkMod3ThenOdd l = and [x `mod` 2 == 1 | x <- l, x `mod` 3 == 0]

---------------  LI-36  ---------------
repeatNTimes :: Int -> [a] -> [a]
repeatNTimes n l = concat [take n (repeat x) | x <- l]

---------------  LI-39  ---------------
myPermutations :: Eq a => [a] -> [[a]]
myPermutations [] = [[]]
myPermutations l = [x:t | x <- l, t <- myPermutations (delete x l)]