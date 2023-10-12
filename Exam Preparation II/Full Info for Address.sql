CREATE TABLE search_results ( id SERIAL PRIMARY KEY, address_name VARCHAR(50), full_name VARCHAR(100), level_of_bill VARCHAR(20), make VARCHAR(30), condition CHAR(1), category_name VARCHAR(50) );

CREATE OR REPLACE PROCEDURE sp_courses_by_address(address_name VARCHAR(100))
AS 
$$
	BEGIN 
	TRUNCATE TABLE search_results;
	INSERT INTO search_results(address_name, full_name, level_of_bill, make, condition, category_name)
		SELECT 
		addresses.name,
		full_name, 
		CASE 
			WHEN courses.bill <= 20 THEN 'Low'
			WHEN courses.bill <= 30 THEN 'Medium'
			ELSE 'High'
		END AS level_of_bill, 
		cars.make, 
		cars.condition,
		categories.name
	FROM addresses 
		JOIN courses ON courses.from_address_id = addresses.id
		JOIN clients ON clients.id = courses.client_id
		JOIN cars ON cars.id = courses.car_id
		JOIN categories ON cars.category_id = categories.id 
	WHERE  addresses.name = address_name
	ORDER BY make, full_name;
	
	END;
$$
LANGUAGE plpgsql;
