% List should only contain numbers as "=\=" apparantly doesnt work with characters

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