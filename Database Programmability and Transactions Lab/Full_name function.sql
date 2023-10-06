CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR, last_name VARCHAR)
RETURNS VARCHAR AS 
$$
	DECLARE
		full_name VARCHAR;
		
	BEGIN 
		IF first_name IS NULL AND last_name IS NULL THEN 
			full_name := NULL;
			
		ELSIF
			first_name IS NULL THEN
				full_name := last_name;
				
		ELSIF 
			last_name IS NULL THEN
				full_name := first_name;
				
		ELSE 
				full_name := CONCAT_WS(' ', first_name, last_name);
				
		END IF;
		
		RETURN full_name;
	END
$$
LANGUAGE plpgsql;
