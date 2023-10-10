CREATE OR REPLACE FUNCTION fn_difficulty_level(level INTEGER)
RETURNS VARCHAR AS
$$
	BEGIN
		CASE 
			WHEN level <= 40 THEN RETURN 'Normal Difficulty';
			WHEN level BETWEEN 41 AND 60 THEN RETURN 'Nightmare Difficulty';
			ELSE RETURN 'Hell Difficulty';
		END CASE;
	END;

$$
LANGUAGE plpgsql;


SELECT 
	user_id,
	level, 
	cash,
	fn_difficulty_level(level) AS difficulty_level 
FROM users_games
ORDER BY user_id ASC;
