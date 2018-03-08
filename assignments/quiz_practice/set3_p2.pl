%% For now, not(A) is being represented as [A]

%% get_variables([],[]) :- !.

%% get_variables([H|T],L) :-
%% 	get_variables(T,A),
%% 	append_extra_vars(H,A,L).

%% append_extra_vars([],A,A) :- !.
%% append_extra_vars([[X]|T],A,L) :-
%% 	modified_append(X,A,P),
%% 	append_extra_vars(T,P,L), !.
%% append_extra_vars([X|T],A,L) :-
%% 	modified_append(X,A,P),
%% 	append_extra_vars(T,P,L).

%% modified_append(X,A,A) :-
%% 	member(X,A), !.
%% modified_append(X,A,[X|A]).

sat(L,PosLiterals) :-
	get_variables(L,V),
	sat_help(L,V,[],PosLiterals).

replace_in_o(_,_,[],[]) :- !.

replace_in_o(X,0,[[X]|T],[1|Q]) :-
	replace_in_o(X,0,T,Q), !.

replace_in_o(X,1,[[X]|T],[0|Q]) :-
	replace_in_o(X,1,T,Q), !.

replace_in_o(X,V,[X|T],[V|Q]) :-
	replace_in_o(X,V,T,Q), !.

replace_in_o(X,V,[[Y]|T],[[Y]|Q]) :-
	\+ X == Y,
	replace_in_o(X,V,T,Q), !.

replace_in_o(X,V,[Y|T],[Y|Q]) :-
	\+ X == Y,
	replace_in_o(X,V,T,Q), !.


replace_v(_,_,[],[]) :- !.
replace_v(X,V,[H|T],[P|Q]) :-
	replace_in_o(X,V,H,P),
	replace_v(X,V,T,Q).

not_all_zeroes([]) :- false, !.
not_all_zeroes([0|L]) :-
	not_all_zeroes(L), !.
not_all_zeroes([X|_]) :- 
    \+ X == 0.

check_sat([]) :- !.
check_sat([X|V]) :-
	not_all_zeroes(X),
	check_sat(V).

sat_help(L,[],History,History) :-
	check_sat(L), !.
sat_help(L,[X|V],History,PosLiterals) :-
	replace_v(X,0,L,A),
	check_sat(A),
	sat_help(A,V,History,PosLiterals).
sat_help(L,[X|V],History,PosLiterals) :-
	replace_v(X,1,L,A),
	check_sat(A),
	append(History,[X],New),
	sat_help(A,V,New,PosLiterals).

