gcd(A,0,A) :- !.
gcd(A,B,G) :-
    C is A mod B,
    gcd(B,C,G).

co_prime(A,B) :-
    gcd(A,B,C),
    C =:= 1.


phi(N,A) :-
    phi_h(N,1,A).

phi_h(1,1,1) :- !.
phi_h(N,N,0) :- !.
phi_h(N,K,A) :-
    K1 is K+1,
    phi_h(N,K1,B),
    (   co_prime(N,K) ->  A is B+1 ; A is B  ).