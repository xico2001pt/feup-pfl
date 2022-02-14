% a)
fatorial(0, 1).
fatorial(N, F) :- N > 0,

                    N1 is N-1,
                    fatorial(N1, Fac),
                    F is N*Fac.

% b)
somaRec(0, 0).
somaRec(N, Sum) :-  N > 0,

                    N1 is N-1,
                    somaRec(N1, S),
                    Sum is N + S.

% c)
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-  N > 1,

                    N1 is N-1,
                    N2 is N-2,
                    fibonacci(N1, F1),
                    fibonacci(N2, F2),
                    F is F1 + F2.

% d)
isDivisible(N, K) :-    N >= 0,
                        S is N mod K,
                        S =:= 0.

isPrimeAux(_, 1).
isPrimeAux(N, K) :- N > 2,
                    \+ isDivisible(N, K),
                    K1 is K-1,
                    isPrimeAux(N, K1).

isPrime(N) :-   N > 1,
                N1 is N-1,
                isPrimeAux(N, N1).