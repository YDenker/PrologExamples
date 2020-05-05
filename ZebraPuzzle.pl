%% Zebra Puzzle

%% Scheme

%% house(Color,Nationality,Beverage,Cigar,Pets).

adjacentLeft(A,B,List) :- append(_,[A,B|_],List). %% House A is on the left of House B
adjacentRight(A,B,List) :- append(_,[B,A|_],List). %% House A is on the right of House B

adjacent(A,B,List) :- adjacentLeft(A,B,List).   %% The House A is on the left or right of House B
adjacent(A,B,List) :- adjacentRight(A,B,List).

houses(Houses) :-
    length(Houses, 5),
    member(house(red,brit,_,_,_),Houses), %% The Brit lives in a red house.
    member(house(_,swede,_,_,dogs),Houses), %% The Swede keeps dogs as pets.
    member(house(_,dane,tea,_,_),Houses), %% The Dane drinks Tea.
    adjacentLeft(house(green,_,_,_,_), house(white,_,_,_,_), Houses), %% The green house is on the left of the white, next to it.
    member(house(green,_,coffee,_,_),Houses), %% The green house owner drinks coffee.
    member(house(_,_,_,pallMall,birds),Houses), %% The person who smokes Pall Mall rears birds.
    member(house(yellow,_,_,dunhill,_), Houses), %% The owner of the yellow house smokes Dunhill.
    Houses = [_,_,house(_,_,milk,_,_),_,_],      %% The Man housing in the center drinks milk.
    Houses = [house(_,norwegian,_,_,_),_,_,_,_], %% The Norwegian lives in the first house.
    adjacent(house(_,_,_,blend,_),house(_,_,_,_,cats), Houses),       %% The man who smokes blend lives next to the one who keeps cats.
    adjacent(house(_,_,_,_,horses),house(_,_,_,dunhill,_), Houses),   %% The man who keeps horses lives next to the man who smokes Dunhill.
    member(house(_,_,beer,blueMaster,_),Houses), %% The man who smokes Blue Master drinks beer.
    member(house(_,german,_,prince,_),Houses), %% The German smokes Prince.
    adjacent(house(_,norwegian,_,_,_),house(blue,_,_,_,_), Houses),   %% The Norwegian lives next to the blue house.
    adjacent(house(_,_,_,blend,_),house(_,_,water,_,_), Houses),      %% The man who smokes blend has a neighbour who drinks water.
    member(house(_,_,_,_,fish),Houses). %% At least one has a fish.
