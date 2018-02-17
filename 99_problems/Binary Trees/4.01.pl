is_btree(nil) :- !.
is_btree(t(A,L,R)) :-
    \+ A == nil,
    is_btree(L),
    is_btree(R).