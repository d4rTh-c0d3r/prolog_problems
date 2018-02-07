nth_elem([X|_], X, 1) :- .!
nth_elem([_|L], X, N) :- 
	N1 is N-1, 
	nth_elem(L,X,N1).

lbo_elem(L,X) :- 
	length(L,N), N1 is N-1, nth_elem(L,X,N1).
