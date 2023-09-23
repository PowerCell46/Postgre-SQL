CREATE TABLE bookings_calculation AS
SELECT booked_for, booked_for * 50::"numeric" AS multiplication, booked_for % 50::"numeric" AS modulo FROM bookings WHERE apartment_id = 93; 
