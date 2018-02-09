% Define a relation (in Prolog) called  twice, where  twice(Elem,List) which is true if
% List is a list and Elem appears in List at least twice. For example, the following are true:
% twice(2,[1,2,3,2]),  twice(a,[a,b,a,c,a,d,a]) but the following are
% not true: twice(2,[1,3,5]), twice(b,[a,b,c])
% The query twice(X,[1,2,3,2,1]) should generate the answers X = 1 and X = 2.  


% Solution (Contains BUG! :- If X is variable and occurs multiple times, it will output it N_C_2 times, i.e. how many possible ways are there to choose the pair):

twice(X, L) :- count(X,L,2).

count(_,_,0) :- !.
count(X,[X|L],N) :- N1 is N-1, count(X,L,N1).
count(X,[_|L],N) :- count(X,L,N).
