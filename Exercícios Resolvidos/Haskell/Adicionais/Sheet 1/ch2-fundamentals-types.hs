import GHC.Float (Floating)
---------------  FT-3  ---------------
mySwap :: (a, b) -> (b, a)
mySwap (x, y) = (y, x)

---------------  FT-4  ---------------
-- a)
distance2 :: Floating a => (a, a) -> (a, a) -> a
distance2 (ax, ay) (bx, by) = sqrt((ax - bx)^2 + (ay - by)^2)

-- b)
distanceInf :: (Floating a, Ord a) => (a, a) -> (a, a) -> a
distanceInf (ax, ay) (bx, by) = max (abs(ay - by)) (abs(ay - by))

---------------  FT-9  ---------------
-- a)   []
-- b)   [[1,2],[],[3],[4,5]]
-- c)   [1,2]:[]:[3]:[[4,5]]
-- d)   [4,5]
-- e)   3
-- f)   Error
-- g)   [[1,2],[3,4,5]]
-- h)   [[],[],[]]
-- i)   ["abc", "", "dce"]
-- j)   [[], [2], [3]]
-- k)   12
-- l)   True

---------------  FT-10  ---------------
-- a)   Returns a pair with the third element and the rest of the string following that element

-- b)
f :: [a] -> (a, [a])
f l = (l !! 2, drop 3 l)

---------------  FT-11  ---------------
-- a)
evaluateLength :: [a] -> String
evaluateLength l
    | len < 2 = "Short"
    | len < 4 = "Medium-sized"
    | otherwise = "Long"
    where len = length l

-- b)
evaluateLength' :: [a] -> String
evaluateLength' [] = "Short"
evaluateLength' [_] = "Short"
evaluateLength' [_,_] = "Medium-sized"
evaluateLength' [_,_,_] = "Medium-sized"
evaluateLength' _ = "Long"

---------------  FT-21  ---------------
-- i)   zip [1,2] "abc" :: [(Integer, Char)]
-- ii)  [[1],[2]] :: [[Int]]
-- iii) [succ 'a'] :: [Char]
-- iv)  [1,2,3,4,5.5] :: [Float]
-- v)   [1,2] == [1,2] :: Bool

---------------  FT-23  ---------------
-- a)   mod :: Integral a => a -> a -> a
-- b)   snd :: (a, b) -> b
-- c)   [head, length] :: [[Int] -> Int]
-- d)   drop :: Int -> [a] -> [a]
-- e)   (!!) :: [a] -> Int -> a
-- f)   zip :: [a] -> [b] -> [(a, b)]

---------------  FT-24  ---------------
function :: Num a => (a, b, a) -> (b, a, b)
function (x, y, z) = (y, x + z, y)