%% Exercise One
wizard(harry).
wizard(dumbledore).
wizard(ron).
wizard(snape).
wizard(voldemort).

witch(hermione).
witch(ginny).
witch(doris). %% doris crockford
witch(minerva). %% minerva mcgonagall
witch(molly). %% molly weasley

good(harry).
good(hermione).
good(ginny).
good(ron).
good(dumbledore).
good(doris).
good(minerva).
good(molly).

bad(voldemort).
bad(snape).

friends(ron,hermione).
friends(X,Y) :- good(X), good(Y).
friends(X,Y) :- bad(X), bad(Y).

bff(X,Y) :- friends(X,Y), witch(X), witch(Y).
bff(X,Y) :- friends(Y,X), witch(X), witch(Y).

hate(X,Y) :- good(X), bad(Y).
hate(X,Y) :- bad(X), good(Y).

whitemagic(X) :- wizard(X), good(X).
whitemagic(X) :- witch(X), good(X).

%% Exercise Two

footballPlayer(adam).
catLover(branda).
loves(cloe,X) :- catLover(X).
eats(daisy,X) :- sweet(X). %% implies that there is food which is sweet --> sweet(haribo).
eats(daisy,X) :- salty(X). %% implies that there is food which is salty --> salty(pretzels).