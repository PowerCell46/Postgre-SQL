SELECT 
	employees.employee_id, 
	concat_ws(' ', employees.first_name, employees.last_name) AS full_name,
	projects.project_id, 
	projects.name
FROM employees
JOIN employees_projects ON employees_projects.employee_id = employees.employee_id
JOIN projects USING(project_id)
 WHERE projects.project_id = 1
