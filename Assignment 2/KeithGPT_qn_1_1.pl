% Exercise 1.2: Determining facts and rules for the unethical predicate.
competitor(sumsum, appy).
smartPhoneTechnology(galacticas3).
developed(sumsum, galacticas3).
stolen(stevey, galacticas3).
boss(stevey, appy).


% Exercise 1.3: The unethical predicate is true if the boss of the company has stolen technology from a competitor and the competitor has developed the technology.
unethical(X) :- 
boss(X, Company), 
stolen(X, Technology), 
developed(Competitor, Technology), 
competitor(Competitor, Company).