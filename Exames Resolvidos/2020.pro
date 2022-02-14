jogo(1, sporting, porto, 1-2).
jogo(1, maritimo, benfica, 2-0).
jogo(2, sporting, benfica, 0-2).
jogo(2, porto, maritimo, 1-0).
jogo(3, maritimo, sporting, 1-1).
jogo(3, benfica, porto, 0-2).

treinadores(porto, [[1-3]-sergio_conceicao]).
treinadores(sporting, [[1-2]-silas, [3-3]-ruben_amorim]).
treinadores(benfica, [[1-3]-bruno_lage]).
treinadores(maritimo, [[1-3]-jose_gomes]).

% 1. n_treinadores(?Equipa, ?Numero)
n_treinadores(Equipa, Numero) :-
    treinadores(Equipa, Treinadores),
    length(Treinadores, Numero).

% 2. 
jornadas_treinador(Treinador, [Jornadas-Treinador | _], Jornadas).
jornadas_treinador(Treinador, [_ | Tail], Jornadas) :- jornadas_treinador(Treinador, Tail, Jornadas).

% n_jornadas_treinador(?Treinador, ?NumeroJornadas)
n_jornadas_treinador(Treinador, NumeroJornadas) :-
    treinadores(_, Treinadores),
    jornadas_treinador(Treinador, Treinadores, [Inicio-Fim]),
    NumeroJornadas is Fim-Inicio+1.

% 3. 
resultado(Jornada, Equipa1, Equipa2, Resultado) :-
    jogo(Jornada, Equipa1, Equipa2, Resultado).

resultado(Jornada, Equipa1, Equipa2, B-A) :-
    jogo(Jornada, Equipa2, Equipa1, A-B).

% ganhou(?Jornada, ?EquipaVencedora, ?EquipaDerrotada)
ganhou(Jornada, EquipaVencedora, EquipaDerrotada) :-
    resultado(Jornada, EquipaVencedora, EquipaDerrotada, V-D),
    V > D.
