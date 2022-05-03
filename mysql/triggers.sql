-- Trigger 1
-- update the account level of a Player (from its default value of noob) when score is inserted in Plays
drop trigger if exists insert_account_level;
delimiter $$
create trigger insert_account_level
after insert on Plays
for each row
begin
if(new.score between 0 and 100) then update Player set account_level = 'noob' where player_id = new.user_id;
elseif(new.score between 100 and 1000) then update Player set account_level = 'beginner' where player_id = new.user_id;
elseif(new.score between 1000 and 2000) then update Player set account_level = 'average' where player_id = new.user_id;
elseif(new.score between 2000 and 5000) then update Player set account_level = 'pro' where player_id = new.user_id;
elseif(new.score > 5000) then update Player set account_level = 'legend' where player_id = new.user_id;
end if;
end $$
delimiter ;

-- Trigger 2
-- update the account level of a Player when score is updated in Plays table
drop trigger if exists update_account_level;
delimiter $$
create trigger update_account_level
after update on Plays
for each row
begin
if(new.score between 0 and 100) then update Player set account_level = 'noob' where player_id = new.user_id;
elseif(new.score between 100 and 1000) then update Player set account_level = 'beginner' where player_id = new.user_id;
elseif(new.score between 1000 and 2000) then update Player set account_level = 'average' where player_id = new.user_id;
elseif(new.score between 2000 and 5000) then update Player set account_level = 'pro' where player_id = new.user_id;
elseif(new.score > 5000) then update Player set account_level = 'legend' where player_id = new.user_id;
end if;
end $$
delimiter ;

-- Trigger 3
-- update the skill_rating of all developers when review is updated
drop trigger if exists update_developer_skill_on_insert;
delimiter $$
create trigger update_developer_skill_on_insert
after insert on Review
for each row
begin
	declare a_s float;
	declare tid int;

	select team_id into tid from Game where game_id = new.game_id;

	CREATE TEMPORARY TABLE IF NOT EXISTS games AS (SELECT game_id from Game where team_id = tid);
    select avg(stars) into a_s from Review where game_id in (select * from games);
    create temporary table if not exists devs as (select dev_id from Member_of where team_id = tid);
    update Developer set skill_rating = a_s where dev_id in (select * from devs);
    drop temporary table games;
    drop temporary table devs;
end $$
delimiter ;

-- Trigger 4
-- listen to transactions and credit and debit from the appropriate accounts
-- drop trigger if exists credit_app_entity;
-- delimiter $$ create trigger credit_app_entity
-- after
-- insert on Transactions for each row begin
-- select count(*) into @n
-- from Member_of
-- where team_id in (
-- 		select team_id
-- 		from Game
-- 		where game_id = id
-- 	);
-- if(
-- 	id_type = 'GAME'
-- 	or id_type = 'ITEM'
-- ) then
-- update Developer
-- set cash_earned = (new.tx_amt) / n
-- where dev_id in (
-- 		select dev_id
-- 		from Member_of
-- 		where team_id in (
-- 				select team_id
-- 				from Game
-- 				where game_id = id
-- 			)
-- 	);
-- elseif(id_type = 'USER') then
-- update Player
-- set coins = coins + new.tx_amt
-- where player_id = id;
-- end if;
-- update Player
-- set coins = coins - new.tx_amt
-- where player_id = payer;
-- end $$ delimiter;
-- -- trigger testing
-- select *
-- from Developer;