SELECT user_id, AGE(starts_at, booked_at) AS "Eearly Birds" FROM bookings WHERE EXTRACT(month from AGE(starts_at, booked_at)) >= 10;
