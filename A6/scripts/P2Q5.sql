#5.	Construct a query to find the most popular destination.

SELECT
	airport.city 			as 'Airport City',
    count(*) 				as 'City Count',
    'Keith Skinner' 	as 'Query Executor',
    NOW() 				as 'Query Date'
FROM
	airport join charter on airport.airport_code = charter.char_destination
GROUP BY 
	airport.airport_code
ORDER BY count(*) DESC;