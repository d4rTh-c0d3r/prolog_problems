construct_btree([],nil) :- !.
construct_btree([H|L],T) :-
    construct_btree(L,T1),
    insert_btree(H,T1,T).

insert_btree(H,nil,t(H,nil,nil)) :- !.
insert_btree(H,t(O,L,R),t(O,L1,R)) :-
    H < O,
    insert_btree(H,L,L1), !.
insert_btree(H,t(O,L,R),t(O,L,R1)) :-
    H >= O,
    insert_btree(H,R,R1).