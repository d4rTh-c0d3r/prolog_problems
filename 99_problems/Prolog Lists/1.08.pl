compress([],[]) :- !.
compress([X],[X]) :- !.
compress([X,X|L],A) :- 
    compress([X|L],A), !.
compress([X,Y|L],A) :-
    X =\= Y,
    compress([Y|L],B),
    append([X],B,A).