SELECT 
	bookings.booking_id, 
	apartments.name AS apartment_owner,
	apartments.apartment_id,
	CONCAT_WS(' ', customers.first_name, customers.last_name) AS customer_name
FROM bookings 
	FULL JOIN 
		apartments ON bookings.booking_id = apartments.booking_id
	FULL JOIN 
		customers ON bookings.customer_id = customers.customer_id
ORDER BY 
	bookings.booking_id ASC,
	apartment_owner ASC,
	customer_name ASC;
