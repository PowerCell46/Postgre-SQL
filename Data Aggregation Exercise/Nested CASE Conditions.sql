CREATE VIEW view_performance_rating AS
SELECT first_name, last_name, job_title, salary, department_id,
	CASE 
		WHEN salary >= 25000 AND job_title LIKE 'Senior%' then 'High-performing Senior'
		WHEN salary >= 25000 AND job_title NOT LIKE 'Senior%' THEN 'High-performing Employee'
		ELSE 'Average-performing'
	END AS performance_rating
FROM employees;
