combination(_,0,[]) :- !.
combination(L,N,L) :-
    length(L,N), !.
combination([X|L],N,[X|A]) :-
    N1 is N-1,
    combination(L,N1,A).
combination([_|L],N,A) :-
    combination(L,N,A).