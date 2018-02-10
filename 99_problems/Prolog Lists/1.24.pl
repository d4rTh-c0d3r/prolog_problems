range(M,M,[M]) :- !.
range(N,M,[N|L]) :-
    N1 is N+1,
    range(N1,M,L).

remove_at(X,[X|L],1,L) :- !.
remove_at(X,[Y|L],N,[Y|A]) :-
    N1 is N-1,
    remove_at(X,L,N1,A).

rnd_select(_,0,[]) :- !.
rnd_select(L,N,[Y|A]) :-
    N1 is N-1,
    length(L,M),
    random(1,M,R),
    remove_at(Y,L,R,L1),
    rnd_select(L1,N1,A).

lotto(N,R,L) :-
    range(1,R,A),
    rnd_select(A,N,L).