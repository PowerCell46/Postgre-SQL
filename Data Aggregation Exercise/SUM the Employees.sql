SELECT 
	SUM(CASE WHEN department_id = 1 THEN 1 ELSE 0 END) AS "Engineering",
	SUM(CASE WHEN department_id = 2 THEN 1 ELSE 0 END) AS "Tool Design",
	SUM(CASE WHEN department_id = 3 THEN 1 ELSE 0 END) AS "Sales",
	SUM(CASE WHEN department_id = 4 THEN 1 ELSE 0 END) AS "Marketing",
	SUM(CASE WHEN department_id = 5 THEN 1 ELSE 0 END) AS "Purchasing",
	SUM(CASE WHEN department_id = 6 THEN 1 ELSE 0 END) AS "Reseach and Development",
	SUM(CASE WHEN department_id = 7 THEN 1 ELSE 0 END) AS "Production"
FROM employees;
