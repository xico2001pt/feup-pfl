---------------  IN-17  ---------------
fib :: (Ord a, Num a, Num p) => a -> p
fib 0 = 0
fib 1 = 1
fib n
    | n > 0 = fib (n-1) + fib (n-2)
    | otherwise = error "negative argument"

---------------  IN-18  ---------------
ackermann :: (Num a, Num t, Ord a, Ord t) => a -> t -> t
ackermann 0 n = n + 1
ackermann m 0 = ackermann (m - 1) 1
ackermann m n
    | m > 0 && n > 0 = ackermann (m - 1) (ackermann m (n - 1))