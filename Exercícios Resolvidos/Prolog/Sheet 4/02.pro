%flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

concat_ordered_lists_no_rep(L, [], L).
concat_ordered_lists_no_rep([], L, L).
concat_ordered_lists_no_rep([H1 | T1], [H2 | T2], [H1 | [R1 | R2]]) :-
    H1 @< H2,
    concat_ordered_lists_no_rep(T1, [H2 | T2], [R1 | R2]), !,
    H1 \= R1.
concat_ordered_lists_no_rep([H1 | T1], [H2 | T2], [H2 | [R1 | R2]]) :-
    H1 @> H2,
    concat_ordered_lists_no_rep([H1 | T1] , T2, [R1 | R2]), !,
    H2 \= R1.
concat_ordered_lists_no_rep([H1 | T1], [H2 | T2], [H1 | [R1 | R2]]) :-
    H1 == H2,
    concat_ordered_lists_no_rep(T1 , T2, [R1 | R2]), !,
    H1 \= R1.
concat_ordered_lists_no_rep([_ | T1], [_ | T2], R) :-
    concat_ordered_lists_no_rep(T1, T2, R).

get_all_origins(ListOfOrigins) :- setof(Origin, Dest^Comp^Code^Hour^Duration^flight(Origin, Dest, Comp, Code, Hour, Duration), ListOfOrigins).

get_all_destinations(ListOfDest) :- setof(Dest, Origin^Comp^Code^Hour^Duration^flight(Origin, Dest, Comp, Code, Hour, Duration), ListOfDest).

% a)
get_all_nodes(ListOfAirports) :-
    get_all_origins(Origins),
    get_all_destinations(Dest),
    concat_ordered_lists_no_rep(Origins, Dest, ListOfAirports).

% b)
number_of_flights_of_company(Company, Number) :-
    flight(_,_,Company,_,_,_), % Need to instanciate the company
    setof(Flight-D, flight(_,D,Company,_,_,_), ListOfFlights),
    length(ListOfFlights, Number).

find_max([], Result-Max, Result).
find_max([Company-N | T], BestCompany-Max, Result) :-
    N > Max,
    find_max(T, Company-N, Result).
find_max([H | T], BestCompany-Max, Result) :-
    find_max(T, BestCompany-Max, Result).

most_diverfied(Company) :-
    setof(C-N, number_of_flights_of_company(C, N), ListOfCompanies),
    find_max(ListOfCompanies, none-0, Company).