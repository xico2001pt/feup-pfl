% a)
female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(haley).
female(poppy).
female(lily).
female(bo).
female(cameron).

male(frank).
male(jay).
male(javier).
male(merle).
male(phil).
male(mitchell).
male(joe).
male(manny).
male(pameron).
male(dylan).
male(alex).
male(luke).
male(rexford).
male(calhoun).
male(george).

parent(grace, phil).
parent(frank, phil).
parent(dede, claire).
parent(dede, mitchell).
parent(jay, claire).
parent(jay, mitchell).
parent(jay, joe).
parent(gloria, joe).
parent(gloria, manny).
parent(javier, manny).
parent(barb, cameron).
parent(barb, pameron).
parent(merle, cameron).
parent(merle, pameron).
parent(phil, haley).
parent(phil, alex).
parent(phil, luke).
parent(claire, haley).
parent(claire, alex).
parent(claire, luke).
parent(mitchell, lily).
parent(mitchell, rexford).
parent(cameron, lily).
parent(cameron, rexford).
parent(pameron, calhoun).
parent(bo, calhoun).
parent(dylan, george).
parent(dylan, poppy).
parent(haley, george).
parent(haley, poppy).

% b)
% i)    female(haley).
% ii)   male(gil).
% iii)  parent(frank, phil).
% iv)   parent(X, claire).
% v)    parent(gloria, Y).
% vi)   parent(jay, _X), parent(_X, Y).
% vii)  parent(_X, lily), parent(Y, _X).
% viii) parent(alex, _).
% ix)   parent(jay, X), \+ parent(gloria, X).

%c
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
grandparent(X, Y) :- parent(X, _Z), parent(_Z, Y).
siblings(X, Y) :- mother(W, X), mother(W, Y), father(Z, X), father(Z, Y), X \= Y.
halfSiblings(X, Y) :- parent(W, X), parent(W, Y), \+ siblings(X, Y), X \= Y.
cousins(X, Y) :- parent(W, X), siblings(W, Z), parent(Z, Y).
uncle(X, Y) :- parent(W, X), cousins(X, W), father(Y, W).