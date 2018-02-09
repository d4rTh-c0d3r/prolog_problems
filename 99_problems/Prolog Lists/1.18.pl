slice([X|_],1,1,[X]) :- !.
slice([X|L],1,N,[X|A]) :- 
    N1 is N-1,
    slice(L,1,N1,A), !.
slice([_|L],N,M,A) :-
    N1 is N-1,
    slice(L,N1,M,A).
