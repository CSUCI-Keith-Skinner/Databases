#8.	Construct a query to return all customers and their distance travelled.

SELECT
	concat(customer.CUS_FNAME, ' ', 
				customer.CUS_LNAME)			as 'Customer Name',
    sum(charter.CHAR_DISTANCE)		as 'Total Distance Travelled',
	'Keith Skinner'										as 'Query Executor',
    now()													as 'Query Date'
FROM
	charter join customer on customer.CUS_CODE = charter.CUS_CODE
GROUP BY charter.CUS_CODE
ORDER BY `Total Distance Travelled` DESC;