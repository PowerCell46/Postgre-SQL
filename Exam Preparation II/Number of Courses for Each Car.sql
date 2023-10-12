SELECT
	cars.id, 
	make,
	mileage,
	COUNT(courses.id) AS count_of_courses,
	ROUND(AVG(courses.bill), 2) AS average_bill
FROM cars
LEFT JOIN courses ON cars.id = courses.car_id
GROUP BY(cars.id)
HAVING COUNT(courses.id) <> 2
ORDER BY count_of_courses DESC, cars.id ASC;
