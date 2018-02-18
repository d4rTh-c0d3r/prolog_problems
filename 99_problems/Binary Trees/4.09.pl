leaves(nil, []) :- !.
leaves(t(X,nil,nil), [X]) :- !.
leaves(t(_,A,B),L) :-
    leaves(A,LL),
    leaves(B,LR),
    append(LL,LR,L).