kmove([A,B],[P,Q]) :-
	kmove_helper([A,B],[P,Q],[[1,2],[2,1],[-1,2],[1,-2],[-2,1],[2,-1],[-1,-2],[-2,-1]]).

kmove_helper(_,_,[]) :- false, !.
kmove_helper([A,B],[P,Q],[[M,N]|_]) :-
	P is A+M,
	Q is B+N,
	P > 0,
	Q > 0,
	P < 9,
	Q < 9.
kmove_helper([A,B],[P,Q],[_|L]) :-
	kmove_helper([A,B],[P,Q],L).


bmove([A,B],[P,Q]) :- 
	bmove_helper([A,B],[P,Q],[[1,1],[-1,-1],[1,-1],[-1,1]]).

bmove_helper(_,_,[]) :- false, !.
bmove_helper([A,B],[P,Q],[X|_]) :-
	get_bmoves([A,B],[P,Q],X).
bmove_helper([A,B],[P,Q],[_|L]) :-
	bmove_helper([A,B],[P,Q],L).

get_bmoves([A,B],[P,Q],[M,N]) :-
	P is A+M,
	Q is B+N,
	P > 0,
	Q > 0,
	P < 9,
	Q < 9.
get_bmoves([A,B],[P,Q],[M,N]) :-
	A > 0,
	B > 0,
	A < 9,
	B < 9,
	R is A+M,
	S is B+N,
	get_bmoves([R,S],[P,Q],[M,N]).