-- update the account level when user score in games increases
drop trigger if exists update_account_level;
delimiter $$
create trigger update_account_level
after update on Plays
for each row
begin
	select avg(score) into @avg_score from Plays;
	if(avg_score between 0 and 100) then
    update Player set account_level = 'noob';
	elseif(avg_score between 100 and 1000) then
	update Player set account_level = 'beginner';
	elseif(avg_score between 1000 and 2000) then
	update Player set account_level = 'average';
	elseif(avg_score between 2000 and 5000) then
	update Player set account_level = 'pro';
	elseif(avg_score > 5000) then
	update Player set account_level = 'legend';
	end if;
end $$
delimiter ;

-- update the skill_rating of all developers when review is posted
drop trigger if exists update_developer_skill_on_insert;
delimiter $$
create trigger update_developer_skill_on_insert
after insert on Review
for each row
begin
select avg(stars) into @avg_stars from Review having game_id = new.game_id;
update Developer set skill_rating = avg_stars where dev_id in (select dev_id from Member_of where team_id in (select team_id from Game where game_id = new.game_id));
end $$
delimiter ;

-- update the skill_rating of all developers when review is updated
drop trigger if exists update_developer_skill_on_update;
delimiter $$
create trigger update_developer_skill_on_update
after update on Review
for each row
begin
select avg(stars) into @avg_stars from Review having game_id = new.game_id;
update Developer set skill_rating = avg_stars where dev_id in (select dev_id from Member_of where team_id in (select team_id from Game where game_id = new.game_id));
end $$
delimiter ;

-- listen to transactions and credit and debit from the appropriate accounts
drop trigger if exists credit_app_entity;
delimiter $$
create trigger credit_app_entity
after insert on Transactions
for each row
begin
select count(*) into @n from Member_of where team_id in (select team_id from Game where game_id = id);
if(id_type = 'GAME' or id_type = 'ITEM') then
update Developer set cash_earned = (new.tx_amt)/n where dev_id in (select dev_id from Member_of where team_id in (select team_id from Game where game_id = id));
elseif(id_type = 'USER') then
update Player set coins = coins + new.tx_amt where player_id = id;
end if;
update Player set coins = coins - new.tx_amt where player_id = payer;
end $$
delimiter ;