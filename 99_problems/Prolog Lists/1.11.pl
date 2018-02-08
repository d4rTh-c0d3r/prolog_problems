pack([],[]) :- !.
pack([X|L],A) :- 
    pack_help([X],X,L,A), !.

pack_help(S,_,[],[S]) :- !.
pack_help(S,X,[X|L],A) :-
    pack_help([X|S],X,L,A).
pack_help(S,X,[Y|L],A) :-
    X =\= Y,
    pack_help([Y],Y,L,B),
    append([S],B,A).

rle(P,A) :- 
    pack(P,L),
    rle_help(L,A).

get_elem([X|L], [N,X]) :-
    length([X|L],N), !.

rle_help([],[]) :- !.
rle_help([H|L],A) :-
    rle_help(L,B),
    get_elem(H,P),
    append([P],B,A), !.

rle_m_help([],[]) :- !.
rle_m_help([[1,X]|L],[X|A]) :-
    rle_m_help(L,A), !.
rle_m_help([H|L],[H|A]) :-
    rle_m_help(L,A).
    
rle_modified(L,A) :- 
    rle(L,B), 
    rle_m_help(B,A).