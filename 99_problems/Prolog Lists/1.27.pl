combination(L,0,[],L) :- !.
combination(L,N,L,[]) :-
    length(L,N), !.
combination([X|L],N,[X|A],T) :-
    N1 is N-1,
    combination(L,N1,A,T).
combination([X|L],N,A,T) :-
    combination(L,N,A,Q),
    append([X],Q,T).

group([],[],[]) :- !.
group(L,[H|T],[A|B]) :-
    combination(L,H,A,L1),
    group(L1,T,B).

