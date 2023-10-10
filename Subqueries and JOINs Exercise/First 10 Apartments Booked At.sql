SELECT 
	apartments.name,
	apartments.country,
	bookings.booked_at::date AS booked_at
FROM apartments 
LEFT JOIN bookings ON apartments.booking_id = bookings.booking_id
LIMIT 10;
