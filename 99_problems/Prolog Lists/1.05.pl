reverse([],[]) :- !.
reverse([X|L], A) :-
    reverse(L,B),
    append(B,[X],A).