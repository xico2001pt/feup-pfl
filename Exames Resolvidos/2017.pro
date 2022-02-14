:-use_module(library(lists)).

%player(Name, UserName, Age)
player('Danny', 'Best Player Ever', 27).
player('Annie', 'Worst Player Ever', 24).
player('Harry', 'A-Star Player', 26).
player('Manny', 'The Player', 14).
player('Jonny', 'A Player', 16).

%game(Name, Categories, MinAge)
game('5 ATG', [action, adventure, open-world, multiplayer], 18).
game('Carrier Shift: Game Over', [action, fps, multiplayer, shooter], 16).
game('Duas Botas', [action, free, strategy, moba], 12).

%played(Player, Game, HoursPlayed, PercentUnlocked)
:- dynamic played/4.
played('Best Player Ever', '5 ATG', 3, 83).
played('Worst Player Ever', '5 ATG', 52, 9).
played('The Player', 'Carrier Shift: Game Over', 44, 22).
played('A Player', 'Carrier Shift: Game Over', 48, 24).
played('A-Star Player', 'Duas Botas', 37, 16).
played('Best Player Ever', 'Duas Botas', 33, 22).

% 1. achievedALot(+Player)
achievedALot(Player) :-
    played(Player, _, _, PercentUnlocked),
    PercentUnlocked >= 80, !.

% 2. isAgeAppropriate(+Name, +Game)
isAgeAppropriate(Name, Game) :-
    player(Name, _, Age),
    game(Game, _, MinAge),
    Age >= MinAge.

% 3. timePlayingGames(+Player, +Games, -ListOfTimes, -SumTimes)
timePlayingGames(_, [], [], 0).

timePlayingGames(Player, [Game | GamesTail], [Time | TimesTail], SumTimes) :-
    played(Player, Game, Time, _), !,
    timePlayingGames(Player, GamesTail, TimesTail, Sum),
    SumTimes is Sum+Time.

timePlayingGames(Player, [_ | GamesTail], [0 | TimesTail], Sum) :-
    timePlayingGames(Player, GamesTail, TimesTail, Sum).

% 4. listGamesOfCategory(+Cat)
listGamesOfCategory(Cat) :-
    game(Name, Cats, MinAge),
    member(Cat, Cats),
    write(Name), write(' ('), write(MinAge), write(')\n'),
    fail.

listGamesOfCategory(_).

% 5. updatePlayer(+Player, +Game, +Hours, +Percentage)
updatePlayer(Player, Game, Hours, Percentage) :-
    retract(played(Player, Game, HoursPlayed, PercentUnlocked)), !,
    NewHours is HoursPlayed+Hours,
    NewPercentage is PercentUnlocked+Percentage,
    asserta(played(Player, Game, NewHours, NewPercentage)).

updatePlayer(Player, Game, Hours, Percentage) :-
    asserta(played(Player, Game, Hours, Percentage)).

% 6. fewHours(+Player, -Games)

% 7. ageRange(+MinAge, +MaxAge, -Players)
getAgePlayers(Min, Max, Player) :-
    player(Player, _, Age),
    Age >= Min, Age =< Max.

ageRange(MinAge, MaxAge, Players) :-
    findall(Player, getAgePlayers(MinAge, MaxAge, Player), Players).

% 8. averageAge(+Game, -AverageAge)
getGameAges(Game, Ages) :-
    findall(Age, (played(Player, Game, _, _), player(_, Player, Age)), Ages).

average(List, Average) :-
    sumlist(List, Sum),
    length(List, Len),
    Average is Sum/Len.

averageAge(Game, AverageAge) :-
    getGameAges(Game, Ages),
    average(Ages, AverageAge).