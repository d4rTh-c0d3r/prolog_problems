rotate(L,N,A) :- 
    length(L,B), 
    M is N mod B, 
    rotate_help(L,M,A).

rotate_help(L,0,L) :- !.
rotate_help([X|L],N,A) :- 
    N1 is N-1,
    append(L,[X],L2),
    rotate_help(L2,N1,A).