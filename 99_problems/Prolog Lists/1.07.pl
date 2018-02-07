my_flatten([],[]) :- !.
my_flatten(X,[X]) :- 
    \+ is_list(X).
my_flatten([X|L], A) :- 
    my_flatten(X,B), 
    my_flatten(L,C), 
    append(B,C,A).