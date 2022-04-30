delimiter $$
create trigger update_account_level
after update on Plays
for each row
begin
	if((max(new.score) between 0 and 100) and (min(new.score) between 0 and 100)) then
    update Player set account_level = 'pro';
	elseif((max(new.score) between 100 and 1000) and (min(new.score) between 100 and 1000)) then
	update Player set account_level = 'beginner';
	elseif((max(new.score) between 1000 and 2000) and (min(new.score) between 1000 and 2000)) then
	update Player set account_level = 'average';
	elseif((max(new.score) between 2000 and 5000) and (min(new.score) between 1500 and 1500)) then
	update Player set account_level = 'pro';
	elseif((max(new.score) >= 5000) and (min(new.score) >= 5000)) then
	update Player set account_level = 'legend';
	end if;
end $$
delimiter ;