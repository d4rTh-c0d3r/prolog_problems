length_list([],0) :- !.
length_list([_,L],N) :-
    length_list(L,N1),
    N is N1+1.
