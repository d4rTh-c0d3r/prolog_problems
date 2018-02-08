drop_n([],_,[]) :- !.
drop_n(L,N,A) :- 
    dn_help(L,N,N,A).

dn_help([],_,_,[]) :- !.
dn_help([_|L],N,1,A) :- 
    dn_help(L,N,N,A), !.
dn_help([X|L],N,M,[X|B]) :-
    M1 is M-1,
    dn_help(L,N,M1,B).