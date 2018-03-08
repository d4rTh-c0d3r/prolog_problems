%% For now, not(A) is being represented as [A]

get_variables([],[]) :- !.

get_variables([H|T],L) :-
	get_variables(T,A),
	append_extra_vars(H,A,L).

append_extra_vars([],A,A) :- !.
append_extra_vars([[X]|T],A,L) :-
	modified_append(X,A,P),
	append_extra_vars(T,P,L), !.
append_extra_vars([X|T],A,L) :-
	modified_append(X,A,P),
	append_extra_vars(T,P,L).

modified_append(X,A,A) :-
	member(X,A), !.
modified_append(X,A,[X|A]).