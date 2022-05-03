-- Query 1 - nested
-- Find all developers who have skill rating more than the average of all

select dev_id from Developer
    where skill_rating > (
        select avg(skill_rating) from Developer
    );

-- Query 2 - nested
-- Find all the games made by developer 23424

select game_name from Game
    where team_id in (
        select team_id from Member_of
            where dev_id = 23424
    );

-- Query 3 - nested
-- Find review made by player who has played atleast 3 hours of that game
-- and with stars less than or equal to 3

select * from Review
    where (user_id, game_id) in (
        select user_id, game_id from Plays
            where play_time >= cast("03:00:00" as time)
    ) 
    and
    stars <= 3;

-- Query 4 - nested
-- Find all players whose have coins greater than the average coins held 
-- by all players

select player_id, coins from Player
    where coins > (
        select avg(coins) from Player
    );

-- Query 5 - correlated
-- Find the reviews of all players which have more stars than the
-- average of stars in all of their reviews
select * from Review R
    where stars >= (
        select avg(stars) from Review S
            where R.user_id = S.user_id
    );

-- Query 6 - correlated
-- Find all pairs of users who have communicated with more than 2 messages

select distinct least(C.player1_id, C.player2_id) player1, greatest(C.player1_id, C.player2_id) player2 from Chats C
    where (select count(*) from Chats D
        where
        (D.player1_id = C.player1_id and D.player2_id = C.player2_id)
        or
        (D.player2_id = C.player1_id and D.player1_id = C.player2_id)
    ) >= 2;

-- Query 7 - correlated
-- Find average transaction amount of a user who has made atleast 
-- one transaction of 100 or more coins

select avg(tx_amt) from Transactions T
    where (
        select count(*) from Transactions U
            where T.payer = U.payer
            and
            U.tx_amt >= 100
    ) >= 1
    group by payer;

