#7.	Construct a query to find the aircraft with the longest total distance chartered.

SELECT
	charter.AC_NUMBER						as 'Aircraft Number',
    sum(charter.CHAR_DISTANCE) 	as 'Total Distance Traveled',
    'Keith Skinner'									as 'Query Executor',
    now()												as 'Query Date'
FROM charter
GROUP BY charter.AC_NUMBER
ORDER BY `Total Distance Traveled` DESC
LIMIT 1;