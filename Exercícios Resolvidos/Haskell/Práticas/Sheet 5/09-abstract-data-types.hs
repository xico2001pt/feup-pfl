import Stack

---------------  Ex 5.1  ---------------
parent :: String -> Bool
parent str = parentAux str empty

parentAux :: String -> Stack Char -> Bool
parentAux [] stk = isEmpty stk
parentAux (x:xs) stk
    | x == '(' || x == '[' || x == '{' = parentAux xs (push x stk)
    | x == ')' = not (isEmpty stk) && top stk == '(' && parentAux xs (pop stk)
    | x == ']' = not (isEmpty stk) && top stk == '[' && parentAux xs (pop stk)
    | x == '}' = not (isEmpty stk) && top stk == '{' && parentAux xs (pop stk)
    | otherwise = parentAux xs stk

---------------  Ex 5.2  ---------------
-- a)
calc :: Stack Float -> String -> Stack Float
calc stk x
    | x == "+" = push (top (pop stk) + top stk) (pop (pop stk))
    | x == "-" = push (top (pop stk) - top stk) (pop (pop stk))
    | x == "*" = push (top (pop stk) * top stk) (pop (pop stk)) 
    | x == "/" = push (top (pop stk) / top stk) (pop (pop stk))
    | otherwise  = push (read x) stk

-- b)
calcular :: String -> Float
calcular str = top (calcularAux (words str) empty)

calcularAux :: [String] -> Stack Float -> Stack Float
calcularAux [] stk = stk
calcularAux (x:xs) stk = calcularAux xs (calc stk x)
