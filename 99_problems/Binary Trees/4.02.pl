cbal_tree(0,nil) :- !.
cbal_tree(N,t(x,A,B)) :-
    mod(N,2) =:= 1,
    N1 is N-1,
    N2 is div(N1,2),
    cbal_tree(N2,A),
    cbal_tree(N2,B), !.
cbal_tree(N,t(x,A,B)) :-
    mod(N,2) =:= 0,
    N_ is N-1,
    N1 is div(N_,2),
    N2 is N_-N1,
    cbal_tree(N1,A),
    cbal_tree(N2,B).
cbal_tree(N,t(x,A,B)) :-
    mod(N,2) =:= 0,
    N_ is N-1,
    N1 is div(N_,2),
    N2 is N_-N1,
    cbal_tree(N2,A),
    cbal_tree(N1,B).