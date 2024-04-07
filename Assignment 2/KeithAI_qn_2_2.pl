% Defining the rules for the Royal family tree.
% Define the parents.
parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

% Define the birth order.
% Prince Charles is older than Princess Ann.
older(prince_charles, princess_ann).

% Princess Ann is older than Prince Andrew.
older(princess_ann, prince_andrew).

% Prince Andrew is older than Prince Edward.
older(prince_andrew, prince_edward).

% Define the old Royal succession rule.
% LOGIC: If A is older than B, then older(A, B). Else, if A is older than X and X is older than B, then older(A, B) - Recursive check.
check_older(A, B):-
    older(A, B).
check_older(A, B):-
    older(A, X), 
    check_older(X, B).

% Succession ordering rules.
% Rule 2
successor(X, Y):-
    parent(A, X), 
    parent(A, Y), 
    check_older(X, Y).

% Rule 3
successor(X, Y):-	
    parent(A, X), 
    parent(A, Y), 
    check_older(X, Y).

% Using the predicate sorting algorithm in Prolog to sort the successors in order of succession ordering by their gender and age.
sort_succession_list(List, SortedList) :-
    predsort(compare_successor, List, SortedList).

% Compares the gender and age, and returns the result back to the sorting algorithm.
compare_successor(Result, X, Y) :-
    (   
       check_older(X, Y) -> Result = (<)
    ;   Result = (>)
    ).

% Return succession list.
succession(X, SuccessionList):-
    setof(Y, parent(X, Y), Successors), 
    sort_succession_list(Successors, SuccessionList).