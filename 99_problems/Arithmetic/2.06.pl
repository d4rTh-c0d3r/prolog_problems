is_prime(2) :- !.
is_prime(3) :- !.
is_prime(N) :- odd(N), has_no_factor(N,3).

odd(N) :- N mod 2 =:= 1.

has_no_factor(N,K) :-
    K*K > N, !.
has_no_factor(N,K) :-
    K*K < N,
    N mod K =\= 0,
    K2 is K+2,
    has_no_factor(N,K2).

goldbach(4,2,2) :- !.
goldbach(N,A,B) :-
    C is N-3,
    gb_h(3,C,A,B).

gb_h(A,B,A,B) :-
    is_prime(A),
    is_prime(B), !.

gb_h(X,Y,A,B) :-
    X1 is X+2,
    Y1 is Y-2,
    gb_h(X1,Y1,A,B).

% Give only even L and U please

goldbach_list(L,U,[]) :-
    L > U, !.
goldbach_list(L,U,[[P,Q]|A]):-
    goldbach(L,P,Q),
    L1 is L+2,
    goldbach_list(L1,U,A).
    

    