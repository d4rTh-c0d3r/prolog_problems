reverse([],[]) :- !.
reverse([X|L], A) :-
    reverse(L,B),
    append(B,[X],A).

is_palin(L) :-
    reverse(L,LR),
    L == LR.