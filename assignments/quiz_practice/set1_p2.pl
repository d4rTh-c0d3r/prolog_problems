subset([],[]) :- !.
subset([_|A], B) :-
	subset(A,B).
subset([X|A],[X|B]) :-
	subset(A,B).

sum_list([],0) :- !.
sum_list([X|L],S) :-
	sum_list(L,T),
	S is T+X.
sSet(L,S,A) :-
	subset(L,A),
	sum_list(A,S).