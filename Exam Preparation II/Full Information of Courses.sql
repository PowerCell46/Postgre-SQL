SELECT 
	addresses.name AS address,
	CASE 	
		WHEN EXTRACT(HOUR FROM courses.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	courses.bill,
	clients.full_name,
	cars.make,
	cars.model,
	categories.name

FROM courses
JOIN addresses ON addresses.id = courses.from_address_id
JOIN clients ON courses.client_id = clients.id
JOIN cars ON courses.car_id = cars.id
JOIN categories ON cars.category_id = categories.id
ORDER BY courses.id;

