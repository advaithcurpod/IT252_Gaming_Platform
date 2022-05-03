-- update the account level when user score in games increases
drop trigger if exists insert_account_level;
delimiter $$ create trigger insert_account_level
after
insert on Plays for each row begin -- select avg(score) into @avg_score from Plays;
	if(
		score between 0 and 100
	) then
update Player
set account_level = 'noob';
elseif(
	score between 100 and 1000
) then
update Player
set account_level = 'beginner';
elseif(
	score between 1000 and 2000
) then
update Player
set account_level = 'average';
elseif(
	score between 2000 and 5000
) then
update Player
set account_level = 'pro';
elseif(score > 5000) then
update Player
set account_level = 'legend';
end if;
end $$ delimiter;
-- update the skill_rating of all developers when review is posted
-- gives an error "result consisted of more than 1 row"
drop trigger if exists update_developer_skill_on_insert;
delimiter $$ create trigger update_developer_skill_on_insert
after
insert on Review for each row begin
select avg(stars) into @avg_stars
from Review
group by game_id;
update Developer
set skill_rating = (
		select avg(stars)
		from Review
		where new.game_id = (
				select game_id
				from Review
			)
	)
where dev_id in (
		select dev_id
		from Member_of
		where team_id in (
				select team_id
				from Game
				where game_id = new.game_id
			)
	);
end $$ delimiter;
-- update the skill_rating of all developers when review is updated
drop trigger if exists update_developer_skill_on_insert;
delimiter $$ create trigger update_developer_skill_on_insert
after
insert on Review for each row begin
declare a_s float;
declare tid int;

select team_id into tid from Game
    where game_id = new.game_id;

CREATE TEMPORARY TABLE IF NOT EXISTS games AS (SELECT game_id from Game where team_id = tid);

select avg(stars) into a_s from Review where game_id in (select * from games);

create temporary table if not exists devs as (select dev_id from Member_of where team_id = tid);

update Developer set skill_rating = a_s where dev_id in (select * from devs);

drop temporary table games;
drop temporary table devs;

end $$
delimiter;

-- select avg(stars) into a_s
-- from Review
-- having game_id = new.game_id;
-- update Developer
-- set skill_rating = avg_stars
-- where dev_id in (
-- 		select dev_id
-- 		from Member_of
-- 		where team_id in (
-- 				select team_id
-- 				from Game
-- 				where game_id = new.game_id
-- 			)
-- 	);
-- listen to transactions and credit and debit from the appropriate accounts
drop trigger if exists credit_app_entity;
delimiter $$ create trigger credit_app_entity
after
insert on Transactions for each row begin

set @amt := new.tx_amt;
update Player set coins = coins - @amt where player_id = new.payer;

if new.id_type = 'USER' then
    update Developer set cash_earned = cash_earned + @amt where dev_id = new.id;
    update Player set coins = coins + @amt where player_id = new.id;
elseif new.id_type = 'GAME' then
    set @tid := (select team_id from Game where game_id = new.id);
    set @n := (select count(*) from Member_of where team_id = @tid);

    update Developer set cash_earned = cash_earned + (@amt / @n)
        where dev_id in (
            select dev_id from Member_of where team_id = @tid
        );
    
    update Player set coins = coins + (@amt / @n)
        where player_id in (
            select dev_id as player_id from Member_of where team_id = @tid
        );
else
    set @gid := (select game_id from GameItem where item_id = new.id);
    set @tid := (select team_id from Game where game_id = @gid);
    set @n := (select count(*) from Member_of where team_id = @tid);

    update Developer set cash_earned = cash_earned + (@amt / @n)
        where dev_id in (
            select dev_id from Member_of where team_id = @tid
        );
    
    update Player set coins = coins + (@amt / @n)
        where player_id in (
            select dev_id as player_id from Member_of where team_id = @tid
        );
end if;

end $$ delimiter;
-- trigger testing
select *
from Developer;
