import GHC.Real (Fractional)
import GHC.Float (Floating)
---------------  IN-3  ---------------
-- a)   (3 - (-2)) + 1
-- b)   (4 / (-2)) - (3 * 6)
-- c)   (2 - 3) * 6
-- d)   (100 `div` 4) `div` 3
-- e)   100 `div` (div 4 3)
-- f)   (1 + 2) + (3 * 4)
-- g)   ((5 `mod` 2) + 2) + (mod 5 2)

---------------  IN-4  ---------------
--                (+)
--            /         \
--          (/)         (*)
--        /     \     /     \
--      (72)   (9)  (-)     (/)
--                 /   \   /   \
--               (5)  (4) (-)  (7)
--                       /   \
--                     (14)  (7)

---------------  IN-6  ---------------
-- a)
half :: Fractional a => a -> a
half x = x / 2

-- b)
xor :: Bool -> Bool -> Bool 
xor a b = (a || b) && not (a && b)

-- c)
cbrt :: Floating a => a -> a
cbrt x = x**(1/3)

-- d)
heron :: Floating a => a -> a -> a -> a
heron a b c =
    sqrt(s * (s - a) * (s - b) * (s - c))
    where s = (a + b + c) / 2

---------------  IN-13  ---------------
-- a)   The function returns the signal of the given number or 0 if it's null.

-- b)
f :: (Ord a, Num a, Integral b) => a -> b
f 0 = 0
f x = if x > 0 then 1 else -1