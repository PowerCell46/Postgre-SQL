SELECT v.driver_id, 
		v.vehicle_type,
		concat_ws(' ', c.first_name, c.last_name) 
FROM vehicles as v JOIN
	campers as c ON
	   v.driver_id = c.id;
