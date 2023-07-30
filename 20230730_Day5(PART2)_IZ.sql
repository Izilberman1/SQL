/*
CASE -> Like IF/THEN statement:
Goes through a set of conditions and returns a value 
if a condition is met.
SYNTAX:
CASE
	WHEN condition1 THEN result1
	WHEN condition2 THEN result2
	WHEN conditionN THEN resultN
	ELSE result
END
*/

/*
CASE -> 
1. NO DEPARTURE TIME = actual_departure is NULL
2. FLIGHT ON TIME = actual_departure-scheduled_departure = LESS THAN 5' MINUTES LATE.
3. FLIGHT IS A LITTLE LATE = actual_departure-scheduled_departure = LESS THAN 1 HOUR AND 5' MINUTES LATE.
4. FLIGHT IS EXTREMELY DELAYED = ALL OTHER RESULTS.
5. COUNT number of flights for each category.
*/
SELECT 
COUNT(*) AS flights,
CASE
	WHEN actual_departure is null THEN 'No Departure Time'
	WHEN actual_departure-scheduled_departure < '00:05' THEN 'Flight Is On Time'
	WHEN actual_departure-scheduled_departure < '01:05' THEN 'Flight is A Little Late'
	ELSE 'Fight Is Extremely Delayed'
END as is_late
FROM flights
GROUP BY is_late;

/*
You need to find out how many tickets you have sold in the following categories:
1. Low price ticket: total_amount < 20,000
2. Mid priice ticket: total_amount between 20,000 and 150,000
3. High price ticket: total_Amount >= 150,000

How many high price tickets has the company sold?
*/

SELECT 
count(*),
CASE
	WHEN total_amount < 20000 THEN 'Low Price Tickets'
	WHEN total_amount < 150000 THEN 'Mid Price Tickets'
	ELSE 'High Price Tickets'
END as ticket_price
FROM bookings
GROUP BY ticket_price;

/*
You need to find out how many flights have departed in the following seasons:
1. Winter = December, January, February
2. Spring = March, April, May
3. Summer: June, July, August
4. Fall: September, October, November
*/

SELECT 
COUNT(*) as flights,
CASE
	WHEN EXTRACT(month from scheduled_departure) IN (12,1,2) THEN 'Winter'
	WHEN EXTRACT (month from scheduled_departure) <= 5 THEN 'Spring'
	WHEN EXTRACT (month from scheduled_departure) <= 8 THEN 'Summer'
ELSE 'Fall' 
END as season
FROM flights
GROUP BY season;

/*
You want to create a tier list in the following way:
1. Rating is 'PG' or 'PG-13' or length is more then 210' minutes:
'Great rating or long (tier 1)'
2. Description contains 'Drama' and length is more than 90' minutes:
'long drama (tier 2)'
3. Description contains 'Drama' and length is not more than 90' minutes:
'Short drama (tier 3)'
4. Rental_rate less than $1:
'Very cheap (tier 4)'
-> If one movie can be in multiple categories, it gets the higher tier assigned.
5. How can you filter to only those movies that appear in one of these 4 tiers?
*/

SELECT
title,
CASE
	WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
	WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
	WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
	WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END as tier_list
FROM film
WHERE 
CASE
	WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
	WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
	WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
	WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END is not null;

