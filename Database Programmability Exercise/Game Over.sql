CREATE OR REPLACE FUNCTION fn_is_game_over(is_game_over BOOLEAN)
RETURNS TABLE(name VARCHAR(50), game_type_id INT, is_finished BOOLEAN) AS
$$
	BEGIN
		RETURN QUERY (SELECT 
				games.name, 
				games.game_type_id,
				games.is_finished
			FROM games
			WHERE games.is_finished = is_game_over);
	END;
$$
LANGUAGE PLPGSQL;
