CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name VARCHAR(20))
AS 
$$
BEGIN
    UPDATE employees
    SET salary = 
        CASE 
            WHEN department_id = (SELECT department_id FROM departments WHERE name = department_name) THEN salary * 1.05
            ELSE salary
        END;
END;
$$
LANGUAGE plpgsql;
