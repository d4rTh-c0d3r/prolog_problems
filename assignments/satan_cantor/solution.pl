;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Part (a)

mod(0,0) :- !.
mod(A,A).
mod(A,B) :- B is -A.

satan_cantor_n(N,A) :-
    sc_n_h(N,0,A).

sc_n_h(N,K,A) :- 
    sum_of_n(N,K,A).
sc_n_h(N,K,A) :- 
    K1 is K+1, 
    sc_n_h(N,K1,A).

list_of_zeros(0,[]) :- !.
list_of_zeros(N,[0|L]) :- 
    N1 is N-1, 
    list_of_zeros(N1,L).

sum_of_n(1,K,[B]) :-
    mod(K,B).
sum_of_n(N,0,A) :- 
    N > 1,
    list_of_zeros(N,A), !.
sum_of_n(N,K,[A|L]) :- 
    N > 1,
    first_elem(0,K,T), 
    K1 is K-T, 
    N1 is N-1,
    mod(T,A),
    sum_of_n(N1, K1, L).

first_elem(K,K,K) :- !.
first_elem(A,_,A).
first_elem(A,K,B) :- C is A+1, first_elem(C,K,B).


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Part (b)


satan_cantor_infi(A) :-
    sci_h(1,A).

sci_h(N,A) :-
    sub_routine_n(N,A).
sci_h(N,A) :-
    N1 is N+1,
    sci_h(N1,A).

sub_routine_n(N,A) :-
    srn_h(N,A,1).

srn_h(N,A,N) :-
    sum_upto_n(N,A).
srn_h(N,A,K) :-
    K < N,
    sum_of_n(K,N,A).
srn_h(N,A,K) :-
    K < N,
    K1 is K+1,
    srn_h(N,A,K1).

sum_upto_n(N,A) :-
    sun_h(N,A,0).

sun_h(N,A,N) :-
    sum_of_n(N,N,A).
sun_h(N,A,K) :-
    K < N,
    sum_of_n(N,K,A).
sun_h(N,A,K) :-
    K < N,
    K1 is K+1,
    sun_h(N,A,K1).    
    
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Part (c)


    
    
    
    
    
    
