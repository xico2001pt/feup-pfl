% a)
list_size([], 0).
list_size([_ | T], Size) :-
                            list_size(T, S),
                            Size is 1 + S.

% b)
list_sum([], 0).
list_sum([N | T], Sum) :-
                            list_sum(T, S),
                            Sum is N + S.

% c)
list_prod([], 1).
list_prod([N | T], Prod) :-
                            list_prod(T, P),
                            Prod is N * P.

% d)
inner_product([], _, 0).
inner_product(_, [], 0).
inner_product([L1 | T1], [L2 | T2], Result) :-
                                                inner_product(T1, T2, R),
                                                Result is L1 * L2 + R.

% e)
count(_, [], 0).
count(Elem, [Elem | T], N) :-
                                count(Elem, T, M),
                                N is 1 + M.
count(Elem, [_ | T], N) :- count(Elem, T, N).