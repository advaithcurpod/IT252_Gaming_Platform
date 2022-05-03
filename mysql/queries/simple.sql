-- Query 1
-- Find ids of all players who have more than 500 coins

select player_id, coins from Player WHERE coins>500;

-- Query 2
-- Find ids and roles of all developers

select dev_id, dev_role from Developer;

-- Query 3
-- find all games

select * from Game WHERE tags LIKE '%Action%';

-- Query 4
-- Find all game items

select item_name from Item
    natural join GameItem;

-- Query 5
-- Find all users who have messaged player 23424

select distinct player2_id from Chats where player1_id = 23424;

-- Query 6
-- Find all people in Dev Team 2

select dev_id from Member_of where team_id = 2;

-- Query 7
-- Find all reviews which has less than or equal to 2 stars

select * from Review where stars <= 2;

-- Query 8
-- Find all transactions which have amount greater than 100

select * from Transactions where tx_amt > 100;

-- Query 9
-- Find total play time of all users for game 2

select sum(play_time) from Plays where game_id = 2;

-- Query 10
-- Find all game names and the team name which made it

select game_name, team_name from Game
    natural join DevTeam;
