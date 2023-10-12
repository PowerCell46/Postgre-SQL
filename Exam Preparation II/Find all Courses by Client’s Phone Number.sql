CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INTEGER AS 
$$
	DECLARE 
		res INT;
	BEGIN 
		SELECT COUNT(*) INTO res FROM courses WHERE client_id = (SELECT id FROM clients WHERE phone_number = phone_num);	
		RETURN res;
	END;
$$
LANGUAGE plpgsql;
