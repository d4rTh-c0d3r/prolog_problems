my_last([X],X) :- !.
my_last([_|L],X) :- 
    my_last(L,X).
