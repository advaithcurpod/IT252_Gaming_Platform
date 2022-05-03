-- 1. Create a view to show all the top players in the platform
CREATE OR REPLACE VIEW top_players AS
SELECT u.user_name as 'Name', avg(p.score) AS 'Score'
FROM User u, Plays p
WHERE u.user_id=p.user_id
GROUP BY u.user_name
ORDER BY avg(p.score) DESC;

SELECT * FROM top_players;

-- 2. Create a view to show the list of top rated games in the platform
CREATE OR REPLACE VIEW top_games AS
SELECT g.game_name as 'Game', avg(r.stars) AS 'Stars'
FROM Game g, Review r
WHERE g.game_id=r.game_id
GROUP BY g.game_name
ORDER BY avg(r.stars) DESC;

SELECT * FROM top_games;

-- 3. Create a view to show the list of top developers in the platform
CREATE OR REPLACE VIEW top_developers AS
SELECT u.user_name as 'Developer', d.skill_rating as 'Rating'
FROM User u, Developer d
WHERE d.dev_id=u.user_id
ORDER BY d.skill_rating DESC;

SELECT * FROM top_developers;

-- 4. Create a view to show all game creators
CREATE OR REPLACE VIEW game_creators AS
SELECT game_name, team_name AS 'Dev Team'
FROM Game;
    
SELECT * FROM game_creators;

-- 5. Create a view to show all the reviews associated to the game without displaying the user_id (ensuring anonymity of the review) 
CREATE OR REPLACE VIEW game_reviews AS
SELECT game_id, review_text 
FROM Review
ORDER BY game_id;

SELECT * FROM game_reviews
