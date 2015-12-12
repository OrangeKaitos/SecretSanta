start(InputFileName) :- 
	see(InputFileName),
    read(PeopleList), read(BlackList), 
    seen,
    length(PeopleList, Length),
    ( not(0 is Length mod 2) -> print('Please note that the number of people are uneven') ),
    findSecretSanta(PeopleList, BlackList).

findSecretSanta([Santa|PeopleList],BlackList):-
	%% TODO
	.

randomListElement([], _):- fail.
randomListElement(PeopleList, El) :-
    length(PeopleList, Length),
    random(0, Length, Index),
    nth0(Index, PeopleList, El).