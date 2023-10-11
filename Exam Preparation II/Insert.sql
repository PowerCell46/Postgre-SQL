INSERT INTO clients (full_name, phone_number)
SELECT
	concat(first_name, ' ', last_name) AS "full_name",
	'(088) 9999' || (id * 2)::VARCHAR AS phone_number
FROM drivers WHERE id BETWEEN 10 AND 20;
