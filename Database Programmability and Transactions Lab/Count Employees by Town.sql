CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name varchar)
RETURNS INT AS
$$
	DECLARE 
		number_of_people INT;
	BEGIN
		SELECT 
			COUNT(*) INTO number_of_people
		FROM employees
		JOIN addresses ON
			employees.address_id = addresses.address_id
		JOIN towns ON
			towns.town_id = addresses.town_id
		WHERE towns."name" = town_name;
		
		RETURN number_of_people;
	END;
$$
LANGUAGE PLPGSQL;
