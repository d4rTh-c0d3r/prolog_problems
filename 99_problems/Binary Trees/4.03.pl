symetric_tree(nil) :- !.
symetric_tree(t(_,A,B)) :-
    mirror(A,B).

mirror(nil,nil) :- !.
mirror(t(_,A,B), t(_,P,Q)) :-
    mirror(B,P),
    mirror(A,Q).
