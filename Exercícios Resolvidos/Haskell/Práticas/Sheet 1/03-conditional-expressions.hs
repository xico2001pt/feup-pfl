---------------  Ex 1.9  ---------------
classifica :: Int -> String
classifica x =
    if x > 18 then "muito bom com distinção" else
    if x > 15 then "muito bom" else
    if x > 12 then "bom" else
    if x > 9 then "suficiente" else
    "reprovado"

classifica' :: Int -> String
classifica' x
    | x > 18 = "muito bom com distinção"
    | x > 15 = "muito bom"
    | x > 12 = "bom"
    | x > 9 = "suficiente"
    | otherwise = "reprovado"

---------------  Ex 1.10  ---------------
imc :: Float -> Float -> Float
imc w h = w / (h**2)

classificaIMC :: Float -> Float -> String
classificaIMC w h
    | i >= 30 = "obesidade"
    | i >= 25 = "excesso de peso"
    | i >= 18.5 = "peso normal"
    | otherwise = "baixo peso"
    where i = imc w h

---------------  Ex 1.11  ---------------
max3 :: Ord a => a -> a -> a -> a
max3 a b c = max (max a b) c

min3 :: Ord a => a -> a -> a -> a
min3 a b c = min (min a b) c

---------------  Ex 1.12  ---------------
xor :: Bool -> Bool -> Bool
xor True True = False
xor True False = True
xor False True = True
xor False False = False

---------------  Ex 1.13  ---------------
safetail :: [a] -> [a]
safetail [] = []
safetail (_:ax) = ax

---------------  Ex 1.14  ---------------
-- a)
curta :: [a] -> Bool
curta l = length l < 3

-- b)
curta' :: [a] -> Bool
curta' [] = True
curta' [_] = True
curta' [_,_] = True
curta' _ = False

---------------  Ex 1.15  ---------------
-- a)
mediana :: Ord a => a -> a -> a -> a
mediana a b c =
    if a > b then (
        if b > c then b
        else (
            if a > c then c
            else a
        )
    ) else (
        if b < c then b
        else (
            if a < c then c
            else a
        )
    )

-- b)
mediana' :: (Ord a, Num a) => a -> a -> a -> a
mediana' a b c = (a + b + c) - max (max a b) c - min (min a b) c

---------------  Ex 1.16  ---------------
unidades :: [String]
unidades =
  [ "zero"
  , "um"
  , "dois"
  , "tres"
  , "quatro"
  , "cinco"
  , "seis"
  , "sete"
  , "oito"
  , "nove"
  ]

dez_a_dezanove :: [String]
dez_a_dezanove =
  [ "dez"
  , "onze"
  , "doze"
  , "treze"
  , "quatorze"
  , "quinze"
  , "dezasseis"
  , "dezassete"
  , "dezoito"
  , "dezanove"
  ]

dezenas :: [String]
dezenas =
  [ "vinte"
  , "trinta"
  , "quarenta"
  , "cinquenta"
  , "sessenta"
  , "setenta"
  , "oitenta"
  , "noventa"
  ]

{-
  A função 'converte2' é composição de duas:
  * 'divide2' obtêm os algarimos;
  * 'combina2' combina o texto de cada algarismo.
  Usamos as operações de concatenação (++) e
  indexação de listas (!!) (note que os índices começam em zero.)
-}
converte2 :: Int -> String
converte2 n | n<100 = combina2 (divide2 n)

divide2 :: Int -> (Int, Int)
divide2 n = (n`div`10, n`mod`10) -- (quociente,resto)

combina2 :: (Int, Int) -> String
combina2 (0, u) = unidades !! u
combina2 (1, u) = dez_a_dezanove !! u
combina2 (d, 0) = dezenas !! (d-2)
combina2 (d, u) = dezenas !! (d-2) ++ " e " ++ unidades !! u

{- Em seguida, resolvemos o problema análogo para números até 3
   algarismos. Necessitamos dos nomes em Português das centenas.
 -}
centenas :: [String]
centenas =
  [ "cento"
  , "duzentos"
  , "trezentos"
  , "quatrocentos"
  , "quinhentos"
  , "seiscentos"
  , "setecentos"
  , "oitocentos"
  , "novecentos"
  ]

{- A função de conversão, nos mesmos moldes da anterior.
   Note o tratamento especial do número 100.  -}
converte3 :: Int -> String
converte3 n | n<1000 = combina3 (divide3 n)

divide3 :: Int -> (Int, Int)
divide3 n = (n`div`100, n`mod`100)

combina3 :: (Int, Int) -> String
combina3 (0, n) = converte2 n
combina3 (1, 0) = "cem"
combina3 (c, 0) = centenas !! (c-1)
combina3 (c, n) = centenas !! (c-1) ++ " e " ++ converte2 n

{- Finalmente podemos resolver o problema para números
  até 6 algarismos, i.e. inferiores a 1 milhão.  -}
converte6 :: Int -> String
converte6 n | n<1000000 = combina6 (divide6 n)

divide6 n = (n `div` 1000, n `mod` 1000)

combina6 (0, n) = converte3 n
combina6 (1, 0) = "mil"
combina6 (1, n) = "mil" ++ ligar n ++ converte3 n
combina6 (m, 0) = converte3 m ++ " mil"
combina6 (m, n) = converte3 m ++ " mil" ++ ligar n ++ converte3 n

{- Uma função auxiliar para escolher a partícula de ligação entre
   milhares e o restante (r).
   Regra: colocamos "e" quando o resto é inferior a 100
   ou múltiplo de 100; caso contrario, basta um espaço.
 -}
ligar :: Int -> String
ligar r
  | r < 100 || r `mod` 100 == 0 = " e "
  | otherwise                   = " "

-- A solução do exercício proposto é converte6.
converte :: Int -> String
converte = converte6