insert_at(1,X,L,[X|L]) :- !.
insert_at(N,X,[Y|L],[Y|A]) :-
    N1 is N-1,
    insert_at(N1,X,L,A).