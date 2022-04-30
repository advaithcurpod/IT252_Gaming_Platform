CREATE VIEW top_players AS
    SELECT u.user_name as 'Name', avg(p.score) AS 'Score'
    FROM User u, Plays p
    WHERE u.user_id=p.user_id
    GROUP BY u.user_name
    ORDER BY avg(p.score) DESC;

SELECT * FROM top_players;


CREATE VIEW top_games AS
    SELECT g.game_name as 'Game', avg(r.stars) AS 'Stars'
    FROM Game g, Reviews r
    WHERE g.game_id=r.game_id
    GROUP BY g.game_name
    ORDER BY avg(r.stars) DESC;

SELECT * FROM top_games;


CREATE VIEW top_developers AS
    SELECT u.user_name as 'Develiper', d.skill_rating as 'Rating'
    FROM User u, Developer d
    WHERE d.dev_id=u.user_id
    ORDER BY d.skill_rating DESC;
    
SELECT * FROM top_developers;


CREATE VIEW game_creators AS
    SELECT game_name, team_id AS 'Dev Team'
    FROM Game;
    
SELECT * FROM game_creators;

