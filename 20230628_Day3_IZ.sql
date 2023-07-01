SELECT 
SUM(amount),
COUNT(*),
ROUND(AVG(amount),2) AS AVERAGE
FROM payment;

/*"
Your manager wants to get a better understanding of the films.
That's why you are asked to write a query to see the
-Minimum
-Maximum
-Average (rounded)
-Sum
of the replacement cost of the films.
"*/
SELECT
SUM(replacement_cost),
ROUND(AVG(replacement_cost),2) AS Average,
MAX(replacement_cost),
MIN(replacement_cost)
FROM film
