insert(X,[],[X]) :- !.
insert(X,[A|L],[A|L]) :-
	X =:= A, !.
insert(X,[A|L],[X,A|L]) :-
	X < A, !.
insert(X,[A|L],[A|P]) :-
	X > A,
	insert(X,L,P).

findNth(P,N,Ans) :-
	fn_help(P,N,[1],Ans).

get_mult_list(_,[],[]) :- !.
get_mult_list(X,[P|L],[A|B]) :-
	A is X*P,
	get_mult_list(X,L,B).

insert_all([],L,L) :- !.
insert_all([X|T],L,Ans) :-
	insert(X,L,L1),
	insert_all(T,L1,Ans).

fn_help(_,1,[X|_],X) :- !.

fn_help(P,N,[X|L],Ans) :-
	get_mult_list(X,P,L1),
	insert_all(L1,L,L2),
	N1 is N-1,
	fn_help(P,N1,L2,Ans).