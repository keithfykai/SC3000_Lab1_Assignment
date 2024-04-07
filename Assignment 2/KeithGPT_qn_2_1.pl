% Defining the rules for the Royal family tree.
% Define the parents.
parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

% Define genders.
male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).
female(queen_elizabeth).

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
successor(X, Y):-
    parent(A, X), 
    parent(A, Y), 
    male(X), 
    female(Y).

successor(X, Y):-
    parent(A, X), 
    parent(A, Y), 
    male(X), 
    male(Y), 
    check_older(X, Y).

successor(X, Y):-	
    parent(A, X), 
    parent(A, Y), 
    female(X), 
    female(Y), 
    check_older(X, Y).

% Using the predicate sorting algorithm in Prolog to sort the successors in order of succession ordering by their gender and age.
sort_succession_list(List, SortedList) :-
    predsort(compare_successor, List, SortedList).

% Part of the sorting algorithm.
compare_successor(Result, X, Y) :-
    (   male(X), female(Y) -> Result = (<)
    ;   female(X), male(Y) -> Result = (>)
    ;   check_older(X, Y) -> Result = (<)
    ;   Result = (>)
    ).

% Return succession list.
succession(X, SuccessionList):-
    setof(Y, parent(X, Y), Successors), 
    sort_succession_list(Successors, SuccessionList).