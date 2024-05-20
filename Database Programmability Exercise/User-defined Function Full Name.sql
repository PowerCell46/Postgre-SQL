CREATE OR REPLACE FUNCTION fn_full_name(first_name varchar, last_name varchar)
RETURNS VARCHAR AS 
$$
	DECLARE
		f_name VARCHAR;
		l_name VARCHAR;
	BEGIN
		IF first_name IS NULL AND last_name IS NULL THEN RETURN null;
		ELSIF first_name IS NULL OR first_name = '' THEN RETURN CONCAT_WS('', UPPER(substring(last_name, 1, 1)), LOWER(substring(last_name, 2, (SELECT length(last_name)) - 1)));
		ELSIF last_name IS NULL OR last_name = '' THEN RETURN CONCAT_WS('', UPPER(substring(first_name, 1, 1)), LOWER(substring(first_name, 2, (SELECT length(first_name)) - 1))); 
		END IF;
		
		f_name := CONCAT_WS('', UPPER(substring(first_name, 1, 1)), LOWER(substring(first_name, 2, (SELECT length(first_name)) - 1)));
		l_name := CONCAT_WS('', UPPER(substring(last_name, 1, 1)), LOWER(substring(last_name, 2, (SELECT length(last_name)) - 1)));
		RETURN CONCAT_WS(' ', f_name, l_name);
	END;
$$
LANGUAGE PLPGSQL;
