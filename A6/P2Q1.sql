#1.	Construct a query to return the concatenated first and last names of customers with your last name.
USE AVIATIONCO;
SELECT concat(CUS_FNAME, ' ', CUS_LNAME) as 'Customer Name', "Keith Skinner" as "Query Executor", now() as "Query Date"
FROM customer
WHERE CUS_LNAME = 'Skinner';