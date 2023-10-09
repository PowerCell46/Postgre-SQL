SELECT
	concat_ws(' ', apartments.address, apartments.address_2) AS apartment_address,
	bookings.booked_for AS nights 
FROM bookings JOIN apartments
ON apartments.booking_id = bookings.booking_id
ORDER BY apartments.apartment_id ASC;
