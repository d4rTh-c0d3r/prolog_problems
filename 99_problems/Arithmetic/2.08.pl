gcd(A,0,A) :- !.
gcd(A,B,G) :-
    C is A mod B,
    gcd(B,C,G).

co_prime(A,B) :-
   gcd(A,B,1). 