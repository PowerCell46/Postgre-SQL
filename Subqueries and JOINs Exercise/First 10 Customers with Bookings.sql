SELECT 
	bookings.booking_id,
	bookings.starts_at::date as starts_at,
	bookings.apartment_id,
	CONCAT_WS(' ', customers.first_name, customers.last_name) AS customer_name
FROM bookings RIGHT JOIN customers ON customers.customer_id = bookings.customer_id
ORDER BY customer_name ASC
LIMIT 10;
