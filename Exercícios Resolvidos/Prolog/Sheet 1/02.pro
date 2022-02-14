% a)
leciona(algoritmos, adalberto).
leciona(basesDeDados, bernardete).
leciona(compiladores, capitolino).
leciona(estatistica, diogenes).
leciona(redes, ermelinda).

frequenta(algoritmos, alberto).
frequenta(algoritmos, bruna).
frequenta(algoritmos, cristina).
frequenta(algoritmos, diogo).
frequenta(algoritmos, eduarda).

frequenta(basesDeDados, antonio).
frequenta(basesDeDados, bruno).
frequenta(basesDeDados, cristina).
frequenta(basesDeDados, duarte).
frequenta(basesDeDados, eduardo).

frequenta(compiladores, alberto).
frequenta(compiladores, bernardo).
frequenta(compiladores, clara).
frequenta(compiladores, diana).
frequenta(compiladores, eurico).

frequenta(estatistica, antonio).
frequenta(estatistica, bruna).
frequenta(estatistica, claudio).
frequenta(estatistica, duarte).
frequenta(estatistica, eva).

frequenta(redes, alvaro).
frequenta(redes, beatriz).
frequenta(redes, claudio).
frequenta(redes, diana).
frequenta(redes, eduardo).

% b)
% i)    leciona(UC, diogenes).
% ii)   leciona(_, felismina).
% iii)  frequenta(UC, claudio).
% iv)   frequenta(_ dalmindo).
% v)    frequenta(_X, eduarda), leciona(_X, bernardete).
% vi)   frequenta(_X, alberto), frequenta(_X, alvaro).

% c)
aluno(X, Y) :- frequenta(_W, X), leciona(_W, Y).
colega(X, Y) :- frequenta(_W, X), frequenta(_W, Y).
colega(X, Y) :- leciona(_, X), leciona(_, Y).