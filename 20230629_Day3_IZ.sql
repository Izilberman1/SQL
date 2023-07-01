SELECT
customer_id,
SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

/*"
1. Your manager wants to know which of the two employees (staff_id)
is responsible for more payments?
2. Which of the two is responsible for a higher overall payment amount?
3. How do these amounts change if we don't consider amounts equal to 0?
"*/

SELECT * FROM payment LIMIT 3;
SELECT staff_id,
SUM(amount),
COUNT(*)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) ASC;

SELECT staff_id,
SUM(amount),
COUNT(*)
FROM payment
WHERE AMOUNT != 0
GROUP BY staff_id;

SELECT
staff_id,
customer_id,
SUM(amount),
COUNT(*)
FROM payment
GROUP BY staff_id, customer_id
ORDER BY COUNT(*) DESC;

/*"
There are two competitions between the two employees.
1. which employee had the highest sales amount in a single day?
2. Which employee had the most sasles in a single day(not
counting payments with amoount = 0?)
"*/
SELECT 
staff_id,
DATE(payment_date),
SUM(amount),
COUNT(*)
FROM payment 
GROUP BY staff_id, DATE(payment_date) 
ORDER BY SUM(amount) DESC;

SELECT 
staff_id,
DATE(payment_date),
COUNT(*)
FROM payment
WHERE amount != 0
GROUP BY staff_id, DATE(payment_date) 
ORDER BY SUM(amount) DESC;

/*"
Filter only for rows where count is equal to 28
or count is equal to 29.
"*/
SELECT 
staff_id,
DATE(payment_date),
COUNT(*)
FROM payment
WHERE amount != 0
GROUP BY staff_id, DATE(payment_date) 
HAVING COUNT(*)=28 OR COUNT(*)=29
ORDER BY SUM(amount) DESC;

/*"
In 2020, April 28, 29 and 30 were days with very high revenue.
That's why we want to focus in this task only on these days (filter accordingly).
1. What is the average payment amount if we group by customer and day- Consider only 
the days/customers with more than 1 payment (per cusotmer and day). 
2. Order by the average amount in a descending order. 
"*/
SELECT 
customer_id,
DATE(payment_date),
ROUND(AVG(amount),2) AS avg_amount,
COUNT(*)
FROM payment
WHERE DATE(payment_date) IN ('2020-04-28',
							'2020-04-29',
							'2020-04-30')
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(*)>1
ORDER BY 3 desc;

