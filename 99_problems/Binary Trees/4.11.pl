at_level(nil,_,[]) :- !.
at_level(t(X,_,_),1,[X]) :- !.
at_level(t(_,A,B),N,L) :-
    N1 is N-1,
    at_level(A,N1,LL),
    at_level(B,N1,LR),
    append(LL,LR,L).