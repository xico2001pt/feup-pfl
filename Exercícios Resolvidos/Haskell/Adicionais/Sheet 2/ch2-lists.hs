---------------  FT-14  ---------------
scalarProduct :: Num p => [p] -> [p] -> p
scalarProduct [] [] = 0
scalarProduct (x:xs) (y:ys) = x * y + scalarProduct xs ys

---------------  FT-18  ---------------
-- a)
seq22 :: Num a => Int -> [a]
seq22 n = (1:replicate (n - 2) 2) ++ [1]
-- b)
seq42 :: Num a => Int -> [a]
seq42 n =  (1:take (n - 2) (cycle [4,2])) ++ [1]

---------------  FT-19  ---------------
-- f computes the second largest element of a list