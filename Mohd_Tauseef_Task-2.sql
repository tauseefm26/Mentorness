-- 1) Total number of reservations:

SELECT COUNT(*) AS total_reservations
FROM hotel_reservation_table;

-- 2) Most popular meal plan:

SELECT type_of_meal_plan, COUNT(*) AS count
FROM hotel_reservation_table
GROUP BY type_of_meal_plan
ORDER BY count DESC
LIMIT 1;

-- 3) Average price per room for reservations involving children:

SELECT AVG(avg_price_per_room) AS avg_price_children
FROM hotel_reservation_table
WHERE no_of_children > 0;

-- 4) Number of reservations made for the year 2018:

SELECT COUNT(*) AS reservations_2018
FROM hotel_reservation_table
WHERE arrival_date LIKE '%-2018';


-- 5) Most commonly booked room type:

SELECT room_type_reserved, COUNT(*) AS count
FROM hotel_reservation_table
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- 6) Reservations falling on a weekend:

SELECT COUNT(*) AS weekend_reservations
FROM hotel_reservation_table
WHERE no_of_weekend_nights > 0;

-- 7) Highest and lowest lead time for reservations:

SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time
FROM hotel_reservation_table;

-- 8) Most common market segment type:

SELECT market_segment_type, COUNT(*) AS count
FROM hotel_reservation_table
GROUP BY market_segment_type
ORDER BY count DESC
LIMIT 1;

-- 9) Number of reservations with a booking status of "Confirmed":

SELECT COUNT(Booking_ID) AS confirmed_reservations
FROM hotel_reservation_table
WHERE booking_status = 'Not_Canceled';

-- 10) Total number of adults and children across all reservations:

SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM hotel_reservation_table;

-- 11) Average number of weekend nights for reservations involving children:

SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_children
FROM hotel_reservation_table
WHERE no_of_children > 0;

-- 12) Number of reservations made in each month:

SELECT MONTH(arrival_date) AS month, COUNT(Booking_ID) AS reservations_count
FROM hotel_reservation_table
GROUP BY month
ORDER BY month;

-- 13) Average number of nights (both weekend and weekday) spent by guests for each room type:

SELECT room_type_reserved,
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_nights
FROM hotel_reservation_table
GROUP BY room_type_reserved;

-- 14) Most common room type and average price for reservations involving children:

WITH child_reservations AS (
    SELECT room_type_reserved, avg_price_per_room
    FROM hotel_reservation_table
    WHERE no_of_children > 0
)
SELECT room_type_reserved, COUNT(*) AS count, AVG(avg_price_per_room) AS avg_price
FROM child_reservations
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- 15) Market segment type generating the highest average price per room:

SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price
FROM hotel_reservation_table
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;





















