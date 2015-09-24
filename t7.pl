% Exercício 1
pred([],[]).
pred([H|T],[H1|T1]):- H1 is H + 1, pred(T,T1).

% O predicado funciona similar ao map em Haskell, somando o valor 1 para cada elemento

% Exercício 2
ziplus([],[],[]).
ziplus([H|T],[H1|T1],[H2|T2]) :-  H2 is H+H1,ziplus(T,T1,T2). 

% Exercício 3
countdown(0,[0]).
countdown(N,[N|T]) :- AUX is N-1,countdown(AUX,T).

% Exercício 4
potencias(0,_).
potencias(N,[H|T]) :- Z is aux(0,N,L), H is 2^Z,potencias(N,T).

aux(0,_,).
aux(M,N,O):-  O <= N, O is M+1.     
