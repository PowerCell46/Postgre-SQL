SELECT 
	drivers.first_name, 
	drivers.last_name,
	cars.make,
	cars.model,
	cars.mileage
FROM cars_drivers
JOIN drivers ON drivers.id = cars_drivers.driver_id
JOIN cars ON cars_drivers.car_id = cars.id
WHERE mileage IS NOT NULL
ORDER BY mileage DESC, first_name ASC;
