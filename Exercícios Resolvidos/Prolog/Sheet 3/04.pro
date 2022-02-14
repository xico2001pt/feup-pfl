print_string([]).
print_string([H|T]) :- put_code(H), print_string(T), !.

% a)
print_n(_, 0).
print_n(S, N) :- N>0, write(S), N1 is N-1, print_n(S, N1), !.

% b)
print_text(Text, Symbol, Padding) :- write(Symbol), print_n(' ', Padding), print_string(Text), print_n(' ', Padding), write(Symbol), !.

% c)
print_banner(Text, Symbol, Padding) :-
    length(Text, T),
    L1 is 2*Padding+T,
    L2 is 2+L1, 
    L3 is L1//2,
    print_n(Symbol, L2), 
    nl,
    print_text([], Symbol, L3),
    nl,
    print_text(Text, Symbol, Padding), 
    nl,
    print_text([], Symbol, L3),
    nl,
    print_n(Symbol, L2).

% d)
read_number_acc(X, X) :- peek_code(10), !.
read_number_acc(Acc, X) :- \+ peek_code(10),
                           get_code(Code),
                           char_code('0', Zero),
                           Digit is Code-Zero,
                           Digit >= 0,
                           Digit < 10,
                           NewAcc is Acc*10 + Digit,
                           read_number_acc(NewAcc, X).
read_number(X) :- read_number_acc(0, X),
                  get_code(10).

% e)
read_until_between(Min, Max, Value) :-
    repeat,
    read_number(Value),
    Value >= Min,
    Value =< Max,
    !.