UPDATE employees SET salary = salary + 1500, job_title = concat_ws(' ', 'Senior', job_title) WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-05';

-- SELECT * FROM employees;
