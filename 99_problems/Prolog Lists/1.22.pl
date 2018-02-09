range(M,M,[M]) :- !.
range(N,M,[N|L]) :-
    N1 is N+1,
    range(N1,M,L).