data Arv a = Vazia | No a (Arv a) (Arv a)

---------------  Ex 4.7  ---------------
sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No a b c) = a + sumArv b + sumArv c

---------------  Ex 4.8  ---------------
listar :: Arv a -> [a]
listar Vazia = []
listar (No a b c) = a:listar b++listar c

---------------  Ex 4.9  ---------------
nivel :: Int -> Arv a -> [a]
nivel _ Vazia = []
nivel 0 (No a _ _) = [a]
nivel n (No a b c) = nivel (n-1) b ++ nivel (n-1) c

---------------  Ex 4.10  ---------------
mapArv :: (a -> b) -> Arv a -> Arv b
mapArv _ Vazia = Vazia
mapArv f (No a b c) = No (f a) (mapArv f b) (mapArv f c)

---------------  Ex 4.12  ---------------
-- a)
maisDir :: Arv a -> a
maisDir (No a _ Vazia) = a
maisDir (No _ _ c) = maisDir c
