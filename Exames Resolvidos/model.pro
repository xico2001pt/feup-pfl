:- use_module(library(lists)).

participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').

performance(1234, [120, 120, 120, 120]).
performance(3423, [32, 120, 45, 120]).
performance(3788, [110, 2, 6, 43]).
performance(4865, [120, 120, 110, 120]).
performance(8937, [97, 101, 105, 110]). 

% 1. madeItThrough(+Participant)
madeItThrough(Participant) :-
    performance(Participant, Times),
    member(120, Times).

% 2.
sumFirst([], _, 0).
sumFirst(_, 0, 0).
sumFirst([Head | Tail], Rem, Res) :-
    Rem1 is Rem-1,
    sumFirst(Tail, Rem1, Res1),
    Res is Head+Res1.

% juriTimes(+Participants, +JuriMember, -Times, -Total)
juriTimes([], _, [], 0).
juriTimes(_, 0, [], 0).

juriTimes([Participant | Participants], JuriMember, [Time | Times], Total) :-
    performance(Participant, List),
    nth1(JuriMember, List, Time),
    juriTimes(Participants, JuriMember, Times, Total1),
    Total is Time+Total1.

% 3.
patientJuriAux(JuriMember, Participant) :-
    performance(P, L),
    P \= Participant,
    nth1(JuriMember, L, 120).

% patientJuri(+JuriMember)
patientJuri(JuriMember) :-
    performance(Participant, L),
    nth1(JuriMember, L, 120), !,
    patientJuriAux(JuriMember, Participant).

% 4. bestParticipant(-P1, -P2, -P)
bestParticipant(P1, P2, P) :-
    performance(P1, L1), performance(P2, L2),
    sumlist(L1, S1), sumlist(L2, S2),
    bestParticipantAux(P1, P2, S1, S2, P).

bestParticipantAux(P1, _, S1, S2, P1) :- S1 > S2.
bestParticipantAux(_, P2, S1, S2, P2) :- S1 < S2.

% 5. allPerfs
allPerfs :-
    performance(Id, List),
    participant(Id, _, Name),
    write(Id:Name:List), write('\n'),
    fail.

allPerfs.