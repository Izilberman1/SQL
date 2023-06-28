SELECT * FROM rental
WHERE rental_date BETWEEN '2005-05-24' AND '2005-05-26 23:59'
ORDER BY rental_date DESC;

SELECT COUNT(*) FROM payment
WHERE payment_date BETWEEN '2020-01-26' AND '2020-01-27 23:59' 
AND amount BETWEEN 1.99 AND 3.99;

SELECT * FROM customer
WHERE customer_id IN(123,212,323,243,353,432);

SELECT COUNT(*) FROM payment 
WHERE customer_id IN(12,25,67,93,124,234)
AND amount IN(4.99,7.99,9.99)
AND payment_date BETWEEN '2020-01-01' AND '2020-01-31 23:59';

SELECT * FROM film
WHERE description LIKE '%Drama%'
AND title LIKE '_T%';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE '___'
AND (last_name LIKE '%X' OR last_name LIKE '%Y');

SELECT COUNT(*) FROM film
WHERE description LIKE '%Documentary%'