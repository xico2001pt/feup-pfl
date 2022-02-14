% a)
invert([], []).
invert([X | T], L3) :-
                        invert(T, L2),
                        append(L2, [X], L3).

% b)
del_one(_, [], []).
del_one(Elem, [Elem | T], T).
del_one(Elem, [X | T], L1) :-
                            del_one(Elem, T, L2),
                            L1 = [X | L2].

% c)
del_all(_, [], []).
del_all(Elem, [Elem | T], L) :-
                                del_all(Elem, T, L).
del_all(Elem, [X | T], L1) :-
                                del_all(Elem, T, L2),
                                L1 = [X | L2].

% e)
del_dups_aux([], []).
del_dups_aux([X], [X]).
del_dups_aux([X, X | T], L2) :-
                                del_dups_aux([X | T], L2).
del_dups_aux([X | T], L2) :-
                                del_dups_aux(T, L),
                                L2 = [X | L].

del_dups(L1, L2) :-
                    sort(L1, L),
                    del_dups_aux(L, L2).

% g)
replicate(0, _, []).
replicate(Amount, Elem, List) :-    Amount > 0,

                                    N is Amount-1,
                                    replicate(N, Elem, L),
                                    List = [Elem | L].

% i)
insert_elem(_, [], Elem, [Elem]).
insert_elem(0, List1, Elem, List2) :-
                                        List2 = [Elem | List1].
insert_elem(Index, [H | T], Elem, List2) :- Index > 0,

                                            I is Index-1,
                                            insert_elem(I, T, Elem, L),
                                            List2 = [H | L].