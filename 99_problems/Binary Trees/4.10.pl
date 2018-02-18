internal_nodes(nil, []) :- !.
internal_nodes(t(_,nil,nil), []) :- !.
internal_nodes(t(X,A,B),[X|L]) :-
    internal_nodes(A,LL),
    internal_nodes(B,LR),
    append(LL,LR,L).