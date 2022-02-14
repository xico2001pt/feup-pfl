---------------  Ex 2.1  ---------------
sumQuadrado :: Int -> Int
sumQuadrado n = sum [x^2 | x <- [1..n]]

---------------  Ex 2.2  ---------------
-- a)
aprox :: Int -> Double
aprox n = 4 * sum [((-1)**x) / ((2 * x) + 1) | x <- [0.0..fromIntegral (n-1)]]

-- b)
aprox' :: Int -> Double
aprox' n = sqrt (12 * sum [((-1)**k) / (k + 1)^2 | k <- [0.0..fromIntegral (n-1)]])

---------------  Ex 2.3  ---------------
dotprod :: [Float] -> [Float] -> Float
dotprod a b = sum [x*y | (x, y) <- zip a b]

---------------  Ex 2.4  ---------------
divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..(n-1)], n `mod` x == 0]

---------------  Ex 2.5  ---------------
perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n], sum (divprop x) == x]

---------------  Ex 2.6  ---------------
pitagoricos :: Integer -> [(Integer, Integer, Integer)]
pitagoricos n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

---------------  Ex 2.7  ---------------
primo :: Integer -> Bool
primo n = length (divprop n) == 1

---------------  Ex 2.8  ---------------
binom :: Integer -> Integer -> Integer
binom n k = product [1..n] `div` (product [1..k] * product [1..(n-k)])

pascal :: Integer -> [[Integer]]
pascal n = [[binom x k | k <- [0..x]] | x <- [0..n]]