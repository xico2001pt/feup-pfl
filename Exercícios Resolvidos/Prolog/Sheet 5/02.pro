:- use_module(library(lists)).

% a)
my_functor(Term, Name, Arity) :-
    Term =.. [Name | Args],
    length(Args, Arity).

my_arg(Index, Term, Arg) :-
    Term =.. [_ | Args],
    nth1(Index, Args, Arg).
