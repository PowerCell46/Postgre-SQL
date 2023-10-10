SELECT 
	apartments.name,
	SUM(bookings.booked_for) AS "sum"
	
FROM apartments 
JOIN bookings ON apartments.apartment_id = bookings.apartment_id 
GROUP BY apartments.name
ORDER BY apartments.name ASC;
