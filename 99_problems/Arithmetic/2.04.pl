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

primes(L,U,[]) :-
    L > U, !.
primes(L,U,[L|A]) :-
    is_prime(L),
    L1 is L+1,
    primes(L1,U,A), !.
primes(L,U,A) :-
    L1 is L+1,
    primes(L1,U,A).
    