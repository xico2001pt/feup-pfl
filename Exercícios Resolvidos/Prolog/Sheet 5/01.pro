% a)
double(X, Y) :- Y is X*2.

map(_, [], []).

map(F, [H | T], Res) :-
    map(F, T, Tail),
    G =.. [F, H, Head],
    G,
    Res = [Head | Tail].

% b)
sum(A, B, C) :- C is A+B.

fold(_, I, [], I).

fold(Func, I, [H | T], F) :-
    fold(Func, I, T, Res),
    S =.. [Func, H, Res, F],
    S.

% c)
even(X) :- 0 =:= X mod 2.

separate([], _, [], []).

separate([H | T], Pred, [H | Y2], N2) :-
    G =.. [Pred, H],
    G, % is true
    separate(T, Pred, Y2, N2).

separate([H | T], Pred, Y2, [H | N2]) :-
    separate(T, Pred, Y2, N2).  

% d)
%read_string()

ask_execute :-
    write(" > "),
    read_string(String),
    call(String).