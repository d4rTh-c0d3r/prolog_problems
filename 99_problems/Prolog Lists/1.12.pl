decode_rle([],[]) :- !.
decode_rle([[N,X]|L],A) :-
    decode_rle(L,B),
    mult(N,X,P),
    append(P,B,A), !.
decode_rle([H|L], [H|P]) :-
    decode_rle(L,P).

mult(0,_,[]) :- !.
mult(N,X,[X|L]) :- 
	N1 is N-1, 
	mult(N1,X,L).