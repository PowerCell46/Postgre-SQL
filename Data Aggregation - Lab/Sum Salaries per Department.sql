SELECT
	department_id,
	sum(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;
