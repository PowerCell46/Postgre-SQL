CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name varchar)
AS
$$
	BEGIN
		UPDATE employees
		SET salary = salary * 1.05
		WHERE department_id = (
			SELECT
				department_id
			FROM departments 
			WHERE 
				name = department_name
			);		
	END;
$$
LANGUAGE PLPGSQL;
