CREATE OR REPLACE FUNCTION fn_difficulty_level(input_level INT)
RETURNS VARCHAR AS
$$
	BEGIN
		IF input_level <= 40 THEN RETURN 'Normal Difficulty';
		ELSIF input_level <= 60 THEN RETURN 'Nightmare Difficulty';
		ELSE RETURN 'Hell Difficulty';
		END IF;
	END;
$$
LANGUAGE PLPGSQL;
