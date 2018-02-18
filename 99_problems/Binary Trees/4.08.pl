count_leaves(nil,0) :- !.
count_leaves(t(x,nil,nil),1) :- !.
count_leaves(t(x,A,B),N) :-
    count_leaves(A,NL),
    count_leaves(B,NR),
    N is NL + NR.