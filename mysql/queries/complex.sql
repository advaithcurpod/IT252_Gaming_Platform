-- Query 1 - nested
-- Find all the games made by developer 3

select game_name from Game
    where game_in in (
        select team_id from Member_of
            where dev_id = 3;
    );

-- Query 2 - nested
-- Find review made by player who has played atleast 3 hours of that game
-- and with stars less than or equal to 3

select * from Review
    where user_id, game_id in (
        select user_id, game_id from Plays
            where play_time >= cast("03:00:00" as time)
    ) 
    and
    stars <= 3;

-- Query 3 - nested

-- Query 4 - nested

-- Query 5 - correlated
-- Find the reviews of all players which have more stars than the
-- average of stars in all of thier reviews
select * from Review R
    where stars >= (
        select avg(stars) from Review S
            where R.user_id = S.user_id
    );

-- Query 6 - correlated

-- Query 7 - correlated
