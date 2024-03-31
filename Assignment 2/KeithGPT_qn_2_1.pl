% Defining the rules for the Royal family tree
% Define the parents
parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

% Define their genders
male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).
female(queen_elizabeth).

% Define the birth order
% Prince Charles is older than Princess Ann, Prince Andrew and Prince Edward.
older(prince_charles, princess_ann).
older(prince_charles, prince_andrew).
older(prince_charles, prince_edward).

% Princess Ann is older than Prince Andrew and Prince Edward.
older(princess_ann, prince_andrew).
older(princess_ann, prince_edward).

% Prince Andrew is older than Prince Edward.
older(prince_andrew, prince_edward).

% Define the old Royal succession rule
%  ',' represents the AND operator, ';' represents the OR operator
/* USAGE: call successor(X, Y) to check if X is the successor of Y.
    e.g successor(prince_charles, X) will return princess_ann, prince_andrew and prince_edward (in order).
*/
successor(X, Y) :-
    male(X), parent(Z, X), parent(Z, Y), older(X, Y).

successor(X, Y) :- 
    male(X), parent(Z, X), parent(Z, Y), female(Y).

successor(X, Y) :- 
    female(X), parent(Z, X), parent(Z, Y), older(X, Y).

find_successors(X, Successors) :-
    setof(Y, successor(X, Y), Successors).
