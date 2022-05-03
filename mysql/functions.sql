use gaming_platform;

DROP FUNCTION if exists find_avgRating;
DELIMITER $$
CREATE FUNCTION find_avgRating (gid INT) RETURNS FLOAT DETERMINISTIC
BEGIN
	DECLARE avg_rating FLOAT;
	SET avg_rating = (SELECT avg(stars) FROM Review WHERE game_id=gid);
	RETURN avg_rating;
END $$
DELIMITER ;
SELECT find_avgRating(2);



DROP FUNCTION if exists find_amt_spent;
DELIMITER $$
CREATE FUNCTION find_amt_spent(uid INT) RETURNS FLOAT DETERMINISTIC
BEGIN
	DECLARE total_spent FLOAT;
	SET total_spent = (SELECT sum(tx_amt) FROM Transactions WHERE payer=uid);
	RETURN total_spent;
END $$
DELIMITER ;
SELECT find_amt_spent(79456);


DROP FUNCTION if exists user_best_game;
DELIMITER $$
CREATE FUNCTION user_best_game(uid INT) RETURNS varchar(50) DETERMINISTIC BEGIN
	DECLARE best_game varchar(50);
	SET best_game = (
					SELECT game_name 
                    FROM Plays p, Game g 
                    WHERE user_id=uid and p.game_id=g.game_id and 
                    p.score=(SELECT MAX(score) FROM Plays)
                    );
	RETURN best_game;
END $$
DELIMITER ;
SELECT user_best_game(38912);


-- number of transations per day
DROP FUNCTION if exists txs_per_day;
DELIMITER $$
CREATE FUNCTION txs_per_day(d date) RETURNS int DETERMINISTIC BEGIN
DECLARE count int;
SET count = (
		SELECT count(*)
		FROM Transactions
		WHERE date(tx_time) = d
	);
RETURN count;
END $$
DELIMITER ;

select txs_per_day("2022-05-03");


-- number of positive reviews for a particular game
DROP FUNCTION if exists positive_reviews;
DELIMITER $$
CREATE FUNCTION positive_reviews(gid int) RETURNS int DETERMINISTIC BEGIN
DECLARE count int;
SET count = (select count(game_id) FROM Review WHERE
((game_id = gid) and
(lower(review_text) like "%good%" or
lower(review_text) like "%awesome%" or
lower(review_text) like "%great%" or
lower(review_text) like "%perfect%" or
lower(review_text) like "%love%" or
lower(review_text) like "%awesome%" or
lower(review_text) like "%fun%")));
RETURN count;
END $$
DELIMITER ;

select positive_reviews(1);
select positive_reviews(2);
select positive_reviews(3);
select positive_reviews(4);
select positive_reviews(5);