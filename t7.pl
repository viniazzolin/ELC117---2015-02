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
intercala(_,[],[]).
intercala(_,L,L) :- length(L,O), O = 1. 
intercala(A,[L1|T1],[L1,A|T2]) :- intercala(A,T1,T2). 

% intercala(A,M,L):- aux1(0,A,M,L).
% aux1(_,_,[],[]). 
% aux1(N, A, M,[L,T1]) :- N mod 2 =\= 0, L = A, P is N+1, aux1(P,A,M,T1).  
% aux1(N, A,[H|T],[L,T1]) :- N mod 2 =:= 0, L is H, P is N+1, aux1(P,A,T,T1).
    
% Exercício 8
comissao(0,_,[]).
comissao(NP,LP,[C|T]) :- NP > 0, elem(C,LP,R), NP1 is NP-1, comissao(NP1,R,T).

elem(X,[X|L],L).
elem(X,[_|L],R) :- el(X,L,R).


% Exercício 9
azulejos(0,0) :- !.
azulejos(NA,NQ) :- A is floor(sqrt(NA)),B is NA-(A^2),azulejos(B,L),NQ is L+1.

