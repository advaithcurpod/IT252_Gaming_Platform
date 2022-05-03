use gaming_platform;

INSERT INTO User VALUES (12412, 'Advaith', 'advaith123@#');
INSERT INTO User VALUES (32432, 'Ranjana', 'ranjana234@#');
INSERT INTO User VALUES (23424, 'Swetha', 'swetha345@#');
INSERT INTO User VALUES (65423, 'Tejaswi', 'tejaswi456@#');
INSERT INTO User VALUES (82423, 'Hegde', 'hegde433@#');
INSERT INTO User VALUES (86543, 'Thomas', 'thomas832@#');
INSERT INTO User VALUES (23486, 'Mary', 'mary324@#');
INSERT INTO User VALUES (43943, 'Prasad', 'prasad943@#');
INSERT INTO User VALUES (23435, 'Ramya', 'ramya451@#');
INSERT INTO User VALUES (38912, 'George', 'george847@#');
INSERT INTO User VALUES (79456, 'Tina', 'tina238@#');
INSERT INTO User VALUES (93451, 'Joseph', 'joseph299@#');

SELECT * FROM User;

INSERT INTO Player(player_id, coins) VALUES (12412, 500);
INSERT INTO Player(player_id, coins) VALUES (32432, 670);
INSERT INTO Player(player_id, coins) VALUES (23424, 880);
INSERT INTO Player(player_id, coins) VALUES (65423, 210);
INSERT INTO Player(player_id, coins) VALUES (82423, 1235);
INSERT INTO Player(player_id, coins) VALUES (86543, 930);
INSERT INTO Player(player_id, coins) VALUES (23486, 100);
INSERT INTO Player(player_id, coins) VALUES (43943, 485);
INSERT INTO Player(player_id, coins) VALUES (23435, 395);
INSERT INTO Player(player_id, coins) VALUES (38912, 840);
INSERT INTO Player(player_id, coins) VALUES (79456, 40);
INSERT INTO Player(player_id, coins) VALUES (93451, 400);

SELECT * FROM Player;

INSERT INTO Developer(dev_id, dev_role, cash_earned) VALUES (32432, 'Team Lead', 5500);
INSERT INTO Developer(dev_id, dev_role, cash_earned) VALUES (23424, 'Lead Programmer', 10000);
INSERT INTO Developer(dev_id, dev_role, cash_earned) VALUES (65423, 'Lead Artist', 23000);
INSERT INTO Developer(dev_id, dev_role, cash_earned) VALUES (82423, 'Game Tester', 6300);
INSERT INTO Developer(dev_id, dev_role, cash_earned) VALUES (43943, 'Team Lead', 1020);
INSERT INTO Developer(dev_id, dev_role, cash_earned) VALUES (23435, 'Lead Programmer', 500);
INSERT INTO Developer(dev_id, dev_role, cash_earned) VALUES (38912, 'Lead Artist', 230);
INSERT INTO Developer(dev_id, dev_role, cash_earned) VALUES (93451, 'Game Tester', 9020);

SELECT * FROM Developer;

INSERT INTO Chats VALUES(23424, 79456, 'Hello Tina, I am Swetha!');
INSERT INTO Chats VALUES(79456, 23424, 'Hello Swetha. Nice to meet you :)');
INSERT INTO Chats VALUES(12412, 43943, 'Yo Prasad, what is your best score today in PUBG?');
INSERT INTO Chats VALUES(86543, 79456, 'Have you started playing League of Legends?');
INSERT INTO Chats VALUES(93451, 23486, 'Mary, wanna play Minecraft now?');
INSERT INTO Chats VALUES(32432, 86543, 'Hey Thomas, coming to battle it out on Fortnite?');

SELECT * FROM Chats;

INSERT INTO DevTeam VALUES(1, 'DarkPlayerGames');
INSERT INTO DevTeam VALUES(2, 'SolarPieGames');

SELECT * FROM DevTeam;

INSERT INTO Game VALUES(1, 'PUBG', 50, 'PUBG is a player versus player shooter game in which up to one hundred players fight in a battle royale, a type of large-scale last man standing deathmatch where players fight to remain the last alive.','Multiplayer, Battle Royale', 1);
INSERT INTO Game VALUES(2, 'Fortnite', 50, 'Fortnite is a free-to-play Battle Royale game with numerous game modes for every type of game player. Watch a concert, build an island or fight.', 'Multiplayer, Battle Royale', 2);
INSERT INTO Game VALUES(3, 'League of Legends', 50, 'League of Legends is a team-based game with over 140 champions to make epic plays with.', 'Multiplayer, Online Battle Arena, Action Role-Playing', 2);
INSERT INTO Game VALUES(4, 'Minecraft', 50, 'Explore infinite worlds and build everything from the simplest of homes to the grandest of castles.', 'Sandbox, Survival, Action, Adventure', 1);

SELECT * FROM Game;

INSERT INTO Member_of VALUES(1, 32432);
INSERT INTO Member_of VALUES(1, 23424);
INSERT INTO Member_of VALUES(1, 65423);
INSERT INTO Member_of VALUES(1, 82423);
INSERT INTO Member_of VALUES(2, 43943);
INSERT INTO Member_of VALUES(2, 23435);
INSERT INTO Member_of VALUES(2, 38912);
INSERT INTO Member_of VALUES(2, 93451);

SELECT * FROM Member_of;

INSERT INTO Review(user_id, game_id, stars, review_text) VALUES (79456, 2, 4, "Awesome game!" );
INSERT INTO Review(user_id, game_id, stars, review_text) VALUES (23486, 1, 1, "Game takes ages to load :(" );
INSERT INTO Review(user_id, game_id, stars, review_text) VALUES (12412, 2, 5, "Love the game! The graphics of this game are excellent" );
INSERT INTO Review(user_id, game_id, stars, review_text) VALUES (79456, 3, 5, "I play this game daily...so much fun" );
INSERT INTO Review(user_id, game_id, stars, review_text) VALUES (86543, 4, 2, "Visuals could be better" );

SELECT * FROM Review;

INSERT INTO Item VALUES(1, 'Gems', 'PLATFORM');
INSERT INTO Item VALUES(2, 'BlitzCrown', 'PLATFORM');
INSERT INTO Item VALUES(3, 'CrystalFruits', 'PLATFORM');
INSERT INTO Item VALUES(4, 'TreasureChests', 'PLATFORM');
INSERT INTO Item VALUES(5, 'Golden Pants', 'GAME');
INSERT INTO Item VALUES(6, 'Coloured Water', 'GAME');

SELECT * FROM Item;

INSERT INTO GameItem VALUES(5, 5, 5.0, 1);
INSERT INTO GameItem VALUES(6, 100, 0.2, 2);

SELECT * FROM GameItem;

INSERT INTO PlatformItem VALUES(1, 10, 12412);
INSERT INTO PlatformItem VALUES(2, 20, 12412);
INSERT INTO PlatformItem VALUES(3, 15, 12412);
INSERT INTO PlatformItem VALUES(4, 5, 12412);

SELECT * FROM PlatformItem;

INSERT INTO Plays(user_id, game_id, score) VALUES(23424, 1, 1000);
INSERT INTO Plays(user_id, game_id, score) VALUES(23435, 2, 1500);
INSERT INTO Plays(user_id, game_id, score) VALUES(38912, 3, 2200);

SELECT * FROM Plays;

INSERT INTO Transactions(tx_id, payer, id, id_type, tx_amt) VALUES(101, 43943, 1, 'GAME', 10);
INSERT INTO Transactions(tx_id, payer, id, id_type, tx_amt) VALUES(102, 79456, 23435, 'USER', 10000);
INSERT INTO Transactions(tx_id, payer, id, id_type, tx_amt) VALUES(103, 93451, 6, 'ITEM', 0.2);
INSERT INTO Transactions(tx_id, payer, id, id_type, tx_amt) VALUES(104, 479456, 38912, 'USER', 5000);

SELECT * FROM Transactions;
