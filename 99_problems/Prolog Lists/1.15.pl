dupli_n([],_,[]) :- !.
dupli_n([X|L],N,A) :- 
    mult(N,X,B), 
    dupli_n(L,N,P), 
    append(B,P,A).

mult(0,_,[]) :- !.
mult(N,X,[X|L]) :- 
    N1 is N-1, 
    mult(N1,X,L).