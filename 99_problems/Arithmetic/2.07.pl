gcd(A,0,A) :- !.
gcd(A,B,G) :-
    C is A mod B,
    gcd(B,C,G).