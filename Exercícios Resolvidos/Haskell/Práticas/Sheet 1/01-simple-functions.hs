---------------  Ex 1.1  ---------------
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = (a < b + c) && (b < a + c) && (c < a + b)

---------------  Ex 1.2  ---------------
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c =
    sqrt (s * (s - a) * (s - b) * (s - c))
    where s = (a + b + c) / 2

---------------  Ex 1.3  ---------------
metades :: [a] -> ([a], [a])
metades l =
    (take half l, drop half l)
    where half = length l `div` 2

---------------  Ex 1.4  ---------------
-- a)
last' :: [a] -> a
last' l = head (reverse l)

last'' :: [a] -> a
last'' l =
    head (drop s l)
    where s = length l - 1

-- b)
init' :: [a] -> [a]
init' l = reverse (drop 1 (reverse l))

init'' :: [a] -> [a]
init'' l = take (length l - 1) l

---------------  Ex 1.5  ---------------
-- a)
binom :: Integer -> Integer -> Integer
binom n k = product [1..n] `div` (product [1..k] * product [1..(n-k)])

-- b)
binom' :: Integer -> Integer -> Integer
binom' n k
    | k < n - k = product [(n-k+1)..n] `div` product [1..k]
    | otherwise = product [(k+1)..n] `div` product [1..(n-k)]
---------------  Ex 1.6  ---------------
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c =
    ((-b - delta) / (2 * a), (-b + delta) / (2 * a))
    where delta = sqrt (b**2 - 4 * a * c)