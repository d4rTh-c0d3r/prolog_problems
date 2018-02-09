split_list(L,0,[],L) :- !.
split_list([X|L],N,[X|A],B) :- 
    N1 is N-1, 
    split_list(L,N1,A,B).