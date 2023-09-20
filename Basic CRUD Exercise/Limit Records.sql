SELECT id as "ID", concat_ws(' ', first_name, last_name) as "Full Name", job_title as "Job Title" from employees ORDER BY first_name ASC LIMIT 50;
