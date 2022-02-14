module Stack (Stack, push, pop, top, empty, isEmpty) where

data Stack a = Stk [a]  -- pilha com valores tipo a

push :: a -> Stack a -> Stack a
push x (Stk xs) = Stk (x:xs)

pop :: Stack a -> Stack a
pop (Stk (_:xs)) = Stk xs

top :: Stack a -> a
top (Stk (x:_)) = x

empty :: Stack a
empty = Stk []

isEmpty :: Stack a -> Bool
isEmpty (Stk []) = True
isEmpty (Stk xs) = False