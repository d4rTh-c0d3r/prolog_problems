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

% A bit inefficient approach, was feeling a bit too lazy. :P

prime_factors(N,L) :- 
    pf_h(N,L,2).

is_factor(N,K) :- N mod K =:= 0.

pf_h(N,[],F) :- 
    F > N, !.
pf_h(N,[A|L],A) :-
    is_prime(A),
    is_factor(N,A),
    N1 is N/A,
    pf_h(N1,L,A), !.
pf_h(N,L,A) :-
    A1 is A+1,
    pf_h(N,L,A1).