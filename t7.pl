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
potencias(N,L) :- aux(0,N,L).

aux(M,N,[]) :- M >= N.
aux(M,N,[H|T]) :- M < N, H is 2^M, I is M+1, aux(I,N,T).

% Exercício 5
positivos([],[]). 
positivos([H|T],M) :- H =< 0, positivos(T,M).
positivos([H|T],[H1|T1]) :- H > 0, H1 is H, positivos(T,T1).     

% Exercício 6
mesmaPosicao(_,[],[]).
mesmaPosicao(A,[L1|T1],[L2|T2]) :- A == L1, A == L2.
mesmaPosicao(A,[L1|T1],[L2|T2]) :- A \== L1, A \== L2, mesmaPosicao(A,T1,T2). 

% Exercício 7

intercala(A,M,L):- aux1(0,A,M,L).

aux1(_,_,[],[]).  
aux1(N, A, M,[L,T1]) :- N mod 2 =\= 0, L = A, P is N+1, aux1(P,A,M,T1).  
aux1(N, A,[H|T],[L,T1]) :- N mod 2 =:= 0, L is H, P is N+1, aux1(P,A,T,T1).    

% Exercício 8
%comissao(NP,LP,C)
%

% Exercício 9
%
%