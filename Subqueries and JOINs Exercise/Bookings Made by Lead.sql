SELECT 
	bookings.apartment_id,
	bookings.booked_for, 
	customers.first_name,
	customers.country 
FROM bookings INNER JOIN customers
ON bookings.customer_id = customers.customer_id
WHERE customers.job_type = 'Lead';
