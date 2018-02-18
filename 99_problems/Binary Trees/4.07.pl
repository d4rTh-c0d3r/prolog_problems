hbal_tree_min(0,nil) :- !.
hbal_tree_min(1,t(x,nil,nil)) :- !.
hbal_tree_min(N,t(x,A,B)) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    hbal_tree_min(N2,A),
    hbal_tree_min(N1,B).

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

num_nodes(nil,0) :- !.
num_nodes(t(x,A,B),N) :-
    num_nodes(A,NL),
    num_nodes(B,NR),
    N is NL+NR+1.

minNodes(H,N) :-
    hbal_tree_min(H,T),
    num_nodes(T,N).

maxHeight(H,N) :-
    max_height_help(H,N,0).

max_height_help(H,N,X) :-
    minNodes(X,M),
    M > N,
    H is X-1, !.
max_height_help(H,N,X) :-
    X1 is X+1,
    max_height_help(H,N,X1).

% I've used a naive algo, because the goal is to learn Prolog and not Algorithms. :D

hbal_tree_nodes(N,T) :-
    maxHeight(H,N),
    hbal_tree(H,T),
    num_nodes(T,M),
    M =:= N.