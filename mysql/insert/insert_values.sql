use gaming_platform;


INSERT INTO User VALUES (12412, 'Advaith', 'advaith123@#')
INSERT INTO User VALUES (32432, 'Ranjana', 'ranjana234@#')
INSERT INTO User VALUES (23424, 'Swetha', 'swetha345@#')
INSERT INTO User VALUES (65423, 'Tejaswi', 'tejaswi456@#')
INSERT INTO User VALUES (82423, 'Hegde', 'hegde433@#')
INSERT INTO User VALUES (86543, 'Thomas', 'thomas832@#')
INSERT INTO User VALUES (23486, 'Mary', 'mary324@#')
INSERT INTO User VALUES (43943, 'Prasad', 'prasad943@#')
INSERT INTO User VALUES (23435, 'Ramya', 'ramya451@#')
INSERT INTO User VALUES (38912, 'George', 'george847@#')
INSERT INTO User VALUES (79456, 'Tina', 'tina238@#')
INSERT INTO User VALUES (93451), 'Joseph', 'joseph299@#')


INSERT INTO Player(player_id, coins) VALUES (12412, 500)
INSERT INTO Player(player_id, coins) VALUES (32432, 670)
INSERT INTO Player(player_id, coins) VALUES (23424, 880)
INSERT INTO Player(player_id, coins) VALUES (65423, 210)
INSERT INTO Player(player_id, coins) VALUES (82423, 1235)
INSERT INTO Player(player_id, coins) VALUES (86543, 930)
INSERT INTO Player(player_id, coins) VALUES (23486, 100)
INSERT INTO Player(player_id, coins) VALUES (43943, 485)
INSERT INTO Player(player_id, coins) VALUES (23435, 395)
INSERT INTO Player(player_id, coins) VALUES (38912, 840)
INSERT INTO Player(player_id, coins) VALUES (79456, 40)
INSERT INTO Player(player_id, coins) VALUES (93451, 400)


INSERT INTO Developer VALUES (32432, 'Team Lead', 5500)
INSERT INTO Developer VALUES (23424, 'Lead Programmer', 10000)
INSERT INTO Developer VALUES (65423, 'Lead Artist', 23000)
INSERT INTO Developer VALUES (82423, 'Game Tester', 6300)
INSERT INTO Developer VALUES (43943, 'Team Lead', 1020)
INSERT INTO Developer VALUES (23435, 'Lead Programmer', 500)
INSERT INTO Developer VALUES (38912, 'Lead Artist', 230)
INSERT INTO Developer VALUES (93451, 'Game Tester', 9020)


INSERT INTO Chats VALUES(23424, 79456, '')
INSERT INTO Chats VALUES(12412, 43943, '')
INSERT INTO Chats VALUES(86543, 79456, '')
INSERT INTO Chats VALUES(93451, 23486, '')
INSERT INTO Chats VALUES(32432, 86543, '')


INSERT INTO DevTeam VALUES(1, '')
INSERT INTO DevTeam VALUES(2, '')


INSERT INTO Game VALUES(1, 'PUBG', 50, 'PUBG is a player versus player shooter game in which up to one hundred players fight in a battle royale, a type of large-scale last man standing deathmatch where players fight to remain the last alive.','Multiplayer, Battle royale')
INSERT INTO Game VALUES(2, 'Fortnite', 50, '', '')
INSERT INTO Game VALUES(3, 'League of Legends', 50, '', '')
INSERT INTO Game VALUES(4, 'Minecraft', 50, '', '')


INSERT INTO Member_of(1, 32432)
INSERT INTO Member_of(1, 23424)
INSERT INTO Member_of(1, 65423)
INSERT INTO Member_of(1, 82423)
INSERT INTO Member_of(2, 43943)
INSERT INTO Member_of(2, 23435)
INSERT INTO Member_of(2, 38912)
INSERT INTO Member_of(2, 93451)


INSERT INTO Review VALUES (79456, 2, 4, "Awesome game!" )
INSERT INTO Review VALUES (23486, 1, 1, "Game takes ages to load :(" )
INSERT INTO Review VALUES (12412, 2, 5, "Love the game! The graphics of this game are excellent" )
INSERT INTO Review VALUES (79456, 3, 4, "I play this game daily...so much fun" )
INSERT INTO Review VALUES (86543, 4, 2, "Visuls could be better" )


INSERT INTO Item VALUES(1, 'Gems', 'PLATFORM')
INSERT INTO Item VALUES(2, 'Avatar1', 'PLATFORM')
INSERT INTO Item VALUES(3, 'Avatar2', 'PLATFORM')
INSERT INTO Item VALUES(4, 'Avatar3', 'PLATFORM')
INSERT INTO Item VALUES(5, '', 'GAME')
