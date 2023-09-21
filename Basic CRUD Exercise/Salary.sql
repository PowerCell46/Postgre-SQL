SELECT concat_ws(' ', first_name, last_name) as "Full Name",  job_title, salary FROM employees WHERE salary IN (12500, 14000, 23600, 25000) ORDER BY salary DESC;
-- SELECT * from employees LIMIT 5;
