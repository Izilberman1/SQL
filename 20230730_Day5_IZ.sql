/*
Mathematical functions and operators
+ -> Addition
- -> Subtraction
* -> Multiplication
/ -> Division (integer division truncates the results such as 9/4=2 not 2.25)
% -> Modulo (remainder such as 9%4=1) 
^ -> Exponentiation (2^3=8)
abs(x) -> Absolute value (abs(-7)=7)
round(x,d) -> Round x to d decimal places (round(4.3543)=4.35)
ceiling(x) -> Round up to integer (ceiling(4.3543)=5)
floor(x) -> Round down to integer (floor(4.3543)=4)
*/

SELECT
film_id,
rental_rate as old_rental_rate,
rental_rate+1 as new_rental_rate
FROM film;

SELECT
film_id,
rental_rate as old_rental_rate,
rental_rate*1.1 as new_rental_rate
FROM film;

SELECT
film_id,
rental_rate as old_rental_rate,
ROUND(rental_rate*1.1,2) as new_rental_rate
FROM film;

SELECT
film_id,
rental_rate as old_rental_rate,
CEILING(rental_rate*1.4)-0.01 as new_rental_rate
FROM film;

/*
Your manager is thinking about increasing the prices of films that are expensive
to replace. For that reason, you should create a list of the films including
the relation of rental rate/replacement cost where the rental rate is less than
4% of the replacement cost.

Create a list of that film_ids together with the percentage rounded to 2
decimal places. For example 3.54(=3.54%)
*/

SELECT 
film_id,
ROUND(rental_rate / replacement_cost*100,2) as percentage
FROM film
WHERE ROUND(rental_rate / replacement_cost*100,2) < 4
ORDER BY 2 ASC;














