SELECT 
UPPER(email) AS email_upper,
LOWER(email) AS email_lower,
email,
LENGTH(email)
FROM customer
WHERE LENGTH(email) < 30;

/*
In the email system there was a problem with names 
where either the first name or
the last name is more than 10 characters long.
Find these customers and output the list of these 
first and last names in all lower case.
*/

SELECT 
LOWER(first_name),
LOWER(last_name),
LOWER(email)
FROM customer
WHERE LENGTH(first_name) > 10 
OR LENGTH(last_name) > 10;

SELECT 
RIGHT(LEFT(first_name,2),1),
first_name
FROM customer;

/*
Extract the last 5 characters of the email address first.
The email address always ends with '.org'.
How can you extract just the dot '.' from the email address?
*/

SELECT 
email,
LEFT(RIGHT(email,4),1)
FROM customer;

SELECT
LEFT(first_name,1) ||'.' || LEFT(last_name,1) || '.' AS initials,
first_name,
last_name
FROM customer;

/*
You need to create a list of the anonymized cersion of the email addresses.
It should be the first character followed by '***' and then the last 
part starting with '@'.
Note the email address always ends with '@sakilacustomer.org'.
*/
SELECT
LEFT(email,1) || '***' || RIGHT(email,19) AS anonymized_email
FROM customer

