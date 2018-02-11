% The idea is to implement a sort function that could sort according
% to the values given by a function mapped on the list.
% It can be the length of its sublists (part 1)
% or frequency of length of sublists (part 2)
% or simple the value of the element itself (for integer sorting)

equal(A,A,1) :- !.
equal(_,_,0) :- !.

f1(X,X) :- !.
f2(L,N) :- length(L,N), !.
f3(_,[],0) :- !.
f3(X,[Y|L],N) :-
    length(X,XL),
    length(Y,YL),
    equal(XL,YL,T),
    f3(X,L,N1),
    N is N1+T.

split_list(L,0,[],L) :- !.
split_list([X|L],N,[X|A],B) :- 
    N1 is N-1, 
    split_list(L,N1,A,B).

my_merge([],B,B) :- !.
my_merge(A,[],A) :- !.
my_merge([X|L1],[Y|L2],[X|L]) :-
    f1(X,Xa), % replace f1 by required function
    f1(Y,Ya), % replace f1 by required function
    Xa < Ya,
    my_merge(L1,[Y|L2],L), !.
my_merge([X|L1],[Y|L2],[Y|L]) :-
    f1(X,Xa), % replace f1 by required function
    f1(Y,Ya), % replace f1 by required function
    Xa >= Ya,
    my_merge([X|L1],L2,L).

merge_sort([],[]) :- !.
merge_sort([X],[X]) :- !.
merge_sort(L,A) :-
    length(L,N),
    N2 is div(N,2),
    split_list(L,N2,L1,L2),
    merge_sort(L1,A1),
    merge_sort(L2,A2),
    my_merge(A1,A2,A).