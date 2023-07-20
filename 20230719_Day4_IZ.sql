SELECT 
LEFT(email,POSITION(last_name IN email)-2),
email
FROM customer;

/*
In this challenge you only have the email address and the last name of the customers.
You need to extrac the first name from the email address and concatenate
it with the last name. It should be in the form:
"Last name, First name".
*/

SELECT 
last_name || ', ' || LEFT(email,POSITION('.' IN email)-1),
last_name
FROM customer;

/*
SUBSTRING -> Used to extract a substring from a string.
SUBSTRING (string from start [for length])
*/

SELECT 
email,
SUBSTRING (email from POSITION ('.' IN email)+1 for LENGTH(last_name))
FROM customer;

/*
If we don't have the length of the last name available. Extract a string that
is in between two different characters using LENGTH and POSITION functions.
*/

SELECT 
email,
SUBSTRING (email from POSITION ('.' IN email)+1 for POSITION('@' IN email)-POSITION('.' in email)-1)
FROM customer;

/*
You need to create an annonymized form of the email addresses 
in the following way:
1. M***.S***@sakilacustomer.org
2. P***.J***@sakilacustomer.org

In a second query create an annonymized form of the email addresses
in the following way:
1. ***Y.S***@sakilacustomer.org
2. ***A.J***@sakilacustomer.org
*/

SELECT 
LEFT(email,1) || '***' 
|| SUBSTRING(email FROM POSITION('.' IN email) for 2)
|| '***' 
|| SUBSTRING(email FROM POSITION('@' IN email))
FROM customer;

SELECT
'***'
|| SUBSTRING(email FROM POSITION('.' IN email)-1 FOR 3)
||'***'
||SUBSTRING(email FROM POSITION('@' IN email))
FROM customer












