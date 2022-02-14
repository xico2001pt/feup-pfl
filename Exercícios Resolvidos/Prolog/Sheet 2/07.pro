% a)
list_append([], L2, L2).
list_append(L1, [], L1).
list_append([H1 | T1], L2, L3) :-
                                    list_append(T1, L2, L),
                                    L3 = [H1 | L].

% b)
list_member(Elem, List) :- append(_, [Elem | _], List).