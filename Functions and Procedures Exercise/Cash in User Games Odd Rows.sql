CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
RETURNS TABLE(total_cash NUMERIC) AS 
$$
	DECLARE
		current_game_id INTEGER;
	BEGIN
	
		SELECT id INTO current_game_id FROM games WHERE name = game_name;		
		RETURN QUERY 
		SELECT ROUND(SUM(cash), 2) AS total_sum 
		FROM (
			SELECT cash, ROW_NUMBER() OVER (ORDER BY cash DESC) AS rn 
			FROM users_games 
			WHERE game_id = current_game_id
		) AS numbered_rows 
		WHERE rn % 2 <> 0;
	END;
$$
LANGUAGE plpgsql;
