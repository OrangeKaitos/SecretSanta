start(InputFileName) :- 
	see(InputFileName),
    read(PeopleList), read(BlackList), 
    seen,
    length(PeopleList, Length),
    ( not(0 is Length mod 2) -> print('Please note that the number of people are uneven \n') ),
    findSecretSanta(PeopleList, BlackList, [], ReturnList),
    print('Santa  :  Receiver \n'),
    printAll(ReturnList).

findSecretSanta([],_,ReturnList, ReturnList).
findSecretSanta([Santa|PeopleList],BlackList, EndList, ReturnList):-
	%% TODO
	randomListElement(PeopleList, Receiver),
	\+(member([Santa,Receiver],BlackList); 
		member([Receiver,Santa],BlackList)"),
	findSecretSanta(PeopleList,BlackList,[[Santa,Receiver]|EndList], ReturnList)
	.


randomListElement([], null).
randomListElement(PeopleList, El) :-
    length(PeopleList, Length),
    random(0, Length, Index),
    nth0(Index, PeopleList, El).

printAll([]).
printAll([[Santa,Receiver]|PeopleList]):-
	print(Santa),
	print(' : '),
	print(Receiver),
	print('\n'),
	printAll(PeopleList).