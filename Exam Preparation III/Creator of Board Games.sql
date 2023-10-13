CREATE OR REPLACE FUNCTION fn_creator_with_board_games(first_name_input VARCHAR(30))
RETURNS INTEGER AS 
$$
	DECLARE
	number_of_games INTEGER;
	BEGIN 
		SELECT 
			COUNT(*) INTO number_of_games
		FROM creators_board_games 
		WHERE creator_id = (SELECT id FROM creators WHERE first_name = first_name_input);

	RETURN number_of_games;
	END;
$$
LANGUAGE plpgsql;
