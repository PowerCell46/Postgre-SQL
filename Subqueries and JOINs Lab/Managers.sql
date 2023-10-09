SELECT 
	employees.employee_id,
	concat_ws(' ', employees.first_name, employees.last_name) AS full_name,
	departments.department_id, 
	departments.name AS department_name
FROM employees 
JOIN departments 
ON departments.manager_id = employees.employee_id
ORDER BY employees.employee_id
LIMIT 5;
