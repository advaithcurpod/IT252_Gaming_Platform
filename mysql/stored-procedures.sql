use gaming_platform;

DROP PROCEDURE if exists start_time ; 

DELIMITER $$
CREATE PROCEDURE start_time(IN uid INT, IN gid INT)
BEGIN
	DECLARE stime datetime DEFAULT CURRENT_TIMESTAMP;
    CREATE temporary table temp_play
	(
		user_id INT,
		game_id INT ,
		s_time datetime,
		e_time datetime DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY(user_id,game_id)
	);
    
    INSERT INTO temp_play(user_id, game_id, s_time) VALUES (uid, gid, stime);
END $$ 

DELIMITER ;

DROP PROCEDURE if exists end_time ; 

DELIMITER $$

CREATE PROCEDURE end_time(IN uid INT, IN gid INT)
BEGIN
	DECLARE etime datetime DEFAULT CURRENT_TIMESTAMP;
	DECLARE p_time time;
	DECLARE start datetime;
    UPDATE temp_play SET e_time = etime WHERE user_id=uid AND game_id=gid;
	SET start = (SELECT s_time FROM temp_play WHERE user_id=uid AND game_id=gid);
    SET p_time = etime - start;
    UPDATE Plays SET play_time = play_time + p_time WHERE user_id=uid AND game_id=gid;
    DROP temporary table temp_play;
END $$ 

DELIMITER ;

CALL start_time(23424,1);
CALL end_time(23424,1);

SELECT * FROM Plays;


DROP PROCEDURE if exists user_chats ; 
DELIMITER $$
CREATE PROCEDURE user_chats(IN uid INT)
BEGIN
	SELECT player2_id FROM Chats WHERE player1_id=uid;
END $$ 
DELIMITER ;

CALL user_chats(12412);


DROP PROCEDURE if exists user_chats; 
DELIMITER $$
CREATE PROCEDURE user_chats(IN uid INT)
BEGIN
	SELECT player2_id FROM Chats WHERE player1_id=uid;
END $$ 
DELIMITER ;

CALL user_chats(12412);


DROP PROCEDURE if exists items_in_game; 
DELIMITER $$
CREATE PROCEDURE items_in_game(IN gid INT)
BEGIN
	SELECT item_name FROM Item i, GameItem g WHERE i.item_id=g.item_id AND game_id=gid;
END $$ 
DELIMITER ;

CALL items_in_game(1);


