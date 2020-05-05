%% Snape's puzzle

%% Danger lies before you, while safety lies behind,
%% Two of us will help you, whichever you would find,
%% One among us seven will let you move ahead,
%% Another will transport the drinker back instead,
%% Two among our number hold only nettle-wine,
%% Three of us are killers, waiting hidden in line
%% Choose, unless you wish to stay here forevermore
%% To help you in your choice, we give you these clues four:
%% First, however slyly the poison tries to hide
%% You will always find some on nettle wine's left side
%% Second, different are those who stand at either end
%% But if you would move onward, neither is your friend;
%% Third as you see clearly, all are different size
%% Neither dwarf nor giant hold death in their insides;
%% Fourth, the second left and the second on the right
%% Are twins once you taste them, though different at first sight.

%% 3 poison, 2 whine, 1 backward, 1 forward potion
%% there is always poison left of the wine
%% left and right bottle hold different content
%% neither left or right let you move forward
%% the smallest bottle does not contain poison
%% the largest bottle does not contain poison
%% second left and second right hold identical content

count([],0).
count([_|T],N) :- count(T,M), plus(M,1,N).

count2(_,[],0).
count2(E,[H|T],N) :- E=H, count2(E,T,M), plus(M,1,N).
count2(E,[H|T],N) :- E\=H, count2(E,T,N).

%% left of every wine is a poison
wine([]).
wine([_]).
wine([poison,wine|T]) :- wine([wine|T]).
wine([_,Y|T]) :- Y \= wine, wine([Y|T]). %% recursion

solution([A,B,C,D,E,F,G]) :-
    member(A,[poison,wine,backward]),   %% A is one of the listed (excluding forward)
    member(B,[wine,forward,backward]),  %% B cannot have poision (biggest bottle)
    member(C,[wine,forward,backward]),  %% C cannot have poision  (smallest bottle)
    member(D,[poison,wine,forward,backward]),
    member(E,[poison,wine,forward,backward]),
    member(F,[poison,wine,forward,backward]),
    member(G,[poison,wine,backward]),   %% cannot be forward
    count2(poison,[A,B,C,D,E,F,G],3),   %% three are poison 
    count2(wine,[A,B,C,D,E,F,G],2),     %% two are wine
    count2(forward,[A,B,C,D,E,F,G],1),  %% one forward  
    count2(backward,[A,B,C,D,E,F,G],1), %% one backward
    wine([A,B,C,D,E,F,G]),              %% left of every wine is poison
    A \= G, %% A is different from G
    B = F.  %% B is the same as F

