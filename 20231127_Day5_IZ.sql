/*
SELECT
COUNT(*),
CASE
WHEN total_amount < 2000 THEN 'low prce ticket'
WHEN total_amount < 150000 THEN 'mid proice ticket'
ELSE 'high prce ticket'
END as ticket_price
FROM bookings
GROUP BY ticket_price

-------------------------------------------------------------------------------------------------

SELECT 
COUNT(*) as flights,
CASE
WHEN EXTRACT (month from scheduled_departure) IN (12,1,2) THEN 'Winter'
WHEN EXTRACT (month from scheduled_departure) <= 5 THEN 'Spring'
WHEN EXTRACT (month from scheduled_departure) <= 8 THEN 'Summer'
ELSE 'Fall'
END as season
FROM flights
GROUP BY season 
-------------------------------------------------------------------------------------------------
SELECT
title,
CASE
WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or very long'
WHEN description LIKE '%Drama%' AND length>90 THEN 'Long Drama'
WHEN description LIKE '%Drama%' THEN 'Short Drama'
WHEN rental_rate<1 THEN 'Very cheap'
END as tier_list
FROM film
WHERE 
CASE
WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or very long'
WHEN description LIKE '%Drama%' AND length>90 THEN 'Long Drama'
WHEN description LIKE '%Drama%' THEN 'Short Drama'
WHEN rental_rate<1 THEN 'Very cheap'
END is not null

----------------------------------------------------------------------------------------------

SELECT 
SUM(CASE
WHEN rating IN ('PG','G') THEN 1
ELSE 0
END) AS no_of_ratings_with_g_or_pg
FROM film

SELECT
rating,
COUNT(*)
FROM film
GROUP BY rating
SELECT
SUM(CASE WHEN rating = 'G' THEN 1 ELSE 0 END) AS "G",
SUM(CASE WHEN rating = 'R' THEN 1 ELSE 0 END) AS "R",
SUM(CASE WHEN rating = 'BC-17' THEN 1 ELSE 0 END) AS "NC-17",
SUM(CASE WHEN rating = 'PG-13' THEN 1 ELSE 0 END) AS "PG-13",
SUM(CASE WHEN rating = 'PG' THEN 1 ELSE 0 END) AS "PG",
FROM film

-------------------------------------------------------------------------------

SELECT
COALESCE(CAST(actual_Arrival-scheduled_arrival AS VARCHAR),'no arrived')
FROM flights
-------------------------------------------------------------------------------

SELECT
rental_date,
COALESCE(CAST(return_date AS VARCHAR),'not returned')
FROM rental
ORDER BY rental_date DESC

-------------------------------------------------------------------------------

SELECT
flight_no,
CAST(REPLACE(flight_no,'PG','') AS BIGINT)
FROM flights
*/