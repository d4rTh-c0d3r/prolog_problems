not_member(A,L) :-
	( member(A,L) -> false ; true ).

remove_at(X,[X|L],1,L) :- !.
remove_at(X,[Y|L],N,[Y|A]) :-
    N1 is N-1,
    remove_at(X,L,N1,A).

rnd_select(_,0,[]) :- !.
rnd_select(L,N,[Y|A]) :-
    N1 is N-1,
    length(L,M),
    M1 is M+1,
    random(1,M1,R),
    remove_at(Y,L,R,L1),
    rnd_select(L1,N1,A).

random_element(L,X) :-
	rnd_select(L,1,[X]).

ktmove([X,Y],[X1,Y1]) :- c1(X,X1), c2(Y,Y1).
ktmove([X,Y],[X1,Y1]) :- c2(X,X1), c1(Y,Y1).

c1(X,X1) :- X > 1, X1 is X-1.
c1(X,X1) :- X < 8, X1 is X+1.
c2(X,X1) :- X > 2, X1 is X-2.
c2(X,X1) :- X < 7, X1 is X+2.

rWalk([X,Y],Walk) :-
	rw_help([X,Y],[[X,Y]],Walk).

rw_help([X,Y],History,History) :-
	findall(R,ktmove([X,Y],R),All),
	choose_step(History,All,[]), !.

rw_help([X,Y],History,Ans) :-
	findall(R,ktmove([X,Y],R),All),
	choose_step(History,All,Next),
	append(History,[Next],H),
	rw_help(Next,H,Ans).

choose_step(History,Choices,Next) :-
	remove_existing(History, Choices, Cs),
	choose_step_help(Cs,Next).

remove_existing(_,[],[]) :- !.
remove_existing(H, [A|L], P) :-
	member(A,H),
	remove_existing(H,L,P), !.
remove_existing(H, [A|L], [A|P]) :-
	remove_existing(H,L,P).

choose_step_help([],[]) :- !.
choose_step_help(Choices,Next) :-
	random_element(Choices,Next).

rpt(0,_) :- !.
rpt(N,C) :-
	rWalk(C,W),
	length(W,L),
	writeln(L),
	N1 is N-1,
	rpt(N1,C).

%% ADDITIONAL PART

path([X1,Y1],[X2,Y2],Path) :-
	