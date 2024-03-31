% Define the order of birth - Rules
older(queen_elizabeth, prince_charles).
older(queen_elizabeth, princess_ann).
older(queen_elizabeth, prince_andrew).
older(queen_elizabeth, prince_edward).
older(prince_charles, princess_ann).
older(prince_charles, prince_andrew).
older(prince_charles, prince_edward).
older(princess_ann, prince_andrew).
older(princess_ann, prince_edward).
older(prince_andrew, prince_edward).

% Define the line of succession
successor(X, Y) :- 
    older(X, Y).

successor(X, Y) :- 
    older(X, Z), successor(Z, Y).

find_successors(X, Successors) :-
    setof(Y, successor(X, Y), Successors).