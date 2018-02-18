hbal_tree(0,nil) :- !.
hbal_tree(N,t(x,A,B)) :-
    N1 is N-1,
    hbal_tree(N1,A),
    hbal_tree(N1,B).
hbal_tree(N,t(x,A,B)) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    hbal_tree(N1,A),
    hbal_tree(N2,B).
hbal_tree(N,t(x,A,B)) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    hbal_tree(N2,A),
    hbal_tree(N1,B).