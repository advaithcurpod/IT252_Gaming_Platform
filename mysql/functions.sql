use gaming_platform;

DELIMITER $$
CREATE FUNCTION find_avgRating (gid INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE avg_rating FLOAT;
	SET avg_rating = (SELECT avg(stars) FROM Review WHERE game_id=gid);
	RETURN avg_rating;
END $$

DELIMITER ;

SELECT find_avgRating(2);


DROP FUNCTION if exists find_amt_spent;
DELIMITER $$
CREATE FUNCTION find_amt_spent(uid INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE total_spent FLOAT;
	SET total_spent = (SELECT sum(tx_amt) FROM Transactions WHERE payer=uid);
	RETURN total_spent;
END $$

DELIMITER ;

SELECT find_amt_spent(79456);


SELECT * FROM Transactions;