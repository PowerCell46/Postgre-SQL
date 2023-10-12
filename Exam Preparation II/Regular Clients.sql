SELECT 
	full_name,
	COUNT(courses.id) AS count_of_cars,
	SUM(bill) AS total_sum
FROM courses 
JOIN CLIENTS ON courses.client_id = clients.id
WHERE full_name LIKE '_a%'
GROUP BY (full_name)
HAVING COUNT(courses.id) <> 1
ORDER BY full_name;
