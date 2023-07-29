/*
EXTRACT -> used to EXTRACT parts of timestamp/date.
EXTRACT(day) 
EXTRACT(seconds)
Date/time types:
date = Just date without time: '2022-11-28'
time (with/without time zone) = Just time without date: '01:02:03.678'
timestamp (with/without time zone) = Date and time: '2022-11-28 01:02:03.678+02'
intervals = Time interval: '01:02:03.678'
SYNTAX:
EXTRACT(field from date/time/interval)
*/

/*
We want to find out in which day of the month we have the most amount of sales?
*/
SELECT
EXTRACT(day from rental_date),
COUNT(*)
FROM rental
GROUP BY EXTRACT(day from rental_date)
ORDER BY COUNT(*) DESC;

/*
You need to analyze the payments and find out the following:
1. What is the month with the highest total payment amount?
2. What is the day of the week witht he highest total payment amount? (0 is Sunday)
3. What is the highest amount one customer has spent in a week?
*/

SELECT
EXTRACT(month from payment_date) as "month",
SUM(amount) as total_payment_amount
FROM payment
GROUP BY "month"
ORDER BY total_payment_amount DESC;

SELECT
EXTRACT(dow from payment_date) as "day_of_week",
SUM(amount) as total_payment_amount
FROM payment
GROUP BY "day_of_week"
ORDER BY total_payment_amount DESC;

SELECT
customer_id,
EXTRACT(week from payment_date) as "week",
SUM(amount) as total_payment_amount
FROM payment
GROUP BY week, customer_id
ORDER BY total_payment_amount DESC;

/*
TO_CHAR -> Used to get custome formats such as timestamp/date/numbers. 
The output of this function (TO_CHAR) is always a plain text format.
TO_CHAR(YYYY-MM)
TO_CHAR(Month)
*/

SELECT
SUM(amount),
TO_CHAR(payment_date,'Dy, Month YYYY')
FROM payment
GROUP BY TO_CHAR(payment_date,'Dy, Month YYYY');

/*
You need to sum payments and group in the following formats:
1. 'Dy, DD/MM/YYYY'
2. 'MMM, YYYY'
3. 'Dy, HH/MM'
*/

SELECT
SUM (amount) as total_payment,
TO_CHAR(payment_date, 'Dy, DD/MM/YYYY') as day
FROM payment
GROUP BY day
ORDER BY total_payment DESC;

SELECT
SUM (amount) as total_payment,
TO_CHAR(payment_date, 'Mon, YYYY') as mon_year
FROM payment
GROUP BY mon_year
ORDER BY total_payment DESC;

SELECT
SUM (amount) as total_payment,
TO_CHAR(payment_date, 'Dy, HH:MI') as day_time
FROM payment
GROUP BY day_time
ORDER BY total_payment DESC;

---------------------------------------------------

SELECT 
CURRENT_TIMESTAMP,
EXTRACT(day from return_date-rental_date)*24
+EXTRACT(hour from return_date-rental_date) || ' hours'
FROM rental;

/*
You need to create a list for the support team of all rental dureations
of customer with customer_id = 35.

You also need to find out for the support team which customer
has the longest average rental duration?
*/

SELECT
customer_id,
return_date-rental_date as rental_duration
FROM rental
WHERE customer_id=35;

SELECT
customer_id,
AVG(return_date-rental_date) as rental_duration
FROM rental
GROUP BY customer_id
ORDER BY rental_duration DESC












