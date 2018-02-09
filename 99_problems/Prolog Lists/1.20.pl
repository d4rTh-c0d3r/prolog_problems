remove_at(X,[X|L],1,L) :- !.
remove_at(X,[Y|L],N,[Y|A]) :-
    N1 is N-1,
    remove_at(X,L,N1,A).