---------------  Ex 4.1  ---------------
primos :: [Int]
primos = crivo [2..]

crivo :: [Int] -> [Int]
crivo (p:ps) = p : crivo [x | x <- ps, x `mod` p /= 0]

factores :: Int -> [Int]
factores 1 = []
factores n = p : factores (n `div` p)
    where p = head [x | x <- primos, n `mod` x == 0]

---------------  Ex 4.2  ---------------
calcPi1 :: Int -> Double
calcPi1 n = sum (take n (zipWith (/) (repeat 4) [(1 + 2 * x) * (-1)**x | x <- [0..]]))

calcPi2 :: Int -> Double
calcPi2 n = 3 + sum (take (n-1) (zipWith (/) [4 * (-1)**x | x <- [0..]] [x * (x+1) * (x+2) | x <- [2,4..]]))

---------------  Ex 4.3  ---------------
intercalar :: a -> [a] -> [[a]]
intercalar x ys = intercalarAux x [] ys

intercalarAux :: a -> [a] -> [a] -> [[a]]
intercalarAux x xs [] = [xs ++ [x]]
intercalarAux x xs (y:ys) = (xs ++ [x] ++ (y:ys)):intercalarAux x (xs ++ [y]) ys


---------------  Ex 4.6  ---------------
-- a)
binom :: Int -> Int -> Int
binom n k = product [1..n] `div` (product [1..k] * product [1..(n-k)])

pascal :: [[Int]]
pascal = [[binom n k | k <- [0..n]] | n <- [0..]]

-- b)
binom' :: Int -> Int -> Int
binom' n 0 = 1
binom' n k = if n == k then 1 else binom' (n-1) (k-1) + binom' (n-1) k