SELECT 
	COUNT(bookings.booking_id)
FROM customers 
JOIN bookings ON customers.customer_id = bookings.customer_id
WHERE last_name = 'Hahn';
