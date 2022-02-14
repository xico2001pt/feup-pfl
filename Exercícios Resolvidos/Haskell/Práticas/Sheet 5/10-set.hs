---------------  Ex 5.3  ---------------

module Set (Set, empty, isEmpty, insert, member) where

data Set a = Empty | Node a (Set a) (Set a)

---------------  Ex 5.4  ---------------

printSet :: Set a -> [a]
printSet Empty = []
printSet (Node a l r) = printSet l ++ [a] ++ printSet r

empty :: Set a
empty = Empty

isEmpty :: Set a -> Bool
isEmpty Empty = True
isEmpty _ = False

insert :: Ord a => a -> Set a -> Set a
insert x Empty = Node x Empty Empty
insert x (Node y l r)
    | x == y = Node y l r
    | x > y = Node y l (insert x r)
    | otherwise = Node y (insert x l) r

member :: Ord a => a -> Set a -> Bool
member _ Empty = False
member x (Node y l r)
    | x == y = True
    | x > y = member x r
    | otherwise = member x l

---------------  Ex 5.5  ---------------
union :: Ord a => Set a -> Set a -> Set a
union s Empty = s
union Empty s = s
-- ERRADO!
--union (Node x xl xr) (Node y yl yr)
--    | x > y = Node x (union xl yl) (union xr yr)
--    | otherwise = Node y (union xl yl) (union xr yr)