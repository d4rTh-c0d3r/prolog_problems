% This is add function for integers, and will work if inputs are simplified
% This requirement is not a limitation. A sane man would not write 0 as p(n(0)).
% The answer would still be correct but will not be in the most simplified form.

next(p(X),X).
next(X,n(X)).

prev(n(X),X).
prev(X,p(X)).

add(X,0,X) :- !.
add(X,n(Y),S) :-
    add(X,Y,S1),
    next(S1,S), !.
add(X,p(Y),S) :-
    add(X,Y,S1),
    prev(S1,S), !.