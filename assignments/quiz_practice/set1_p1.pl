zeroes(0,[]) :- !.
zeroes(N,[0|A]) :-
	N1 is N-1,
	zeroes(N1,A).

cc(A, D, Ans) :-
	sort(D,Dst),
	reverse(Dst,Ds),
	cc_help(A, Ds, Ans).

cc_help(0, D, A) :- 
	length(D,N), 
	zeroes(N,A), !.

cc_help(A, [_|D], [0|Ans]) :-
	A > 0,
	cc_help(A,D,Ans).

cc_help(A, [X|D], [Y|Ans]) :-
	A > 0,
	B is A-X,
	cc_help(B, [X|D], [Z|Ans]),
	Y is Z+1.


nways(A,D,Ans) :-
	sort(D,Dst),
	reverse(Dst,Ds),
	nways_help(A,Ds,Ans).

nways_help(0,_,1) :- !.
nways_help(_,[],0) :- !.
nways_help(A,_,0) :- A < 0, !.
nways_help(A,[X|D],Ans) :-
	nways_help(A,D,A1),
	B is A-X,
	nways_help(B,[X|D],A2),
	Ans is A1+A2.
