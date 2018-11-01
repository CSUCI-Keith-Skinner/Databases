use aviationco;
SELECT 
	airport.airport_code,
	airport.city as 'Airport City',
    COUNT(*) as 'Number of Flights to City',
    'Keith Skinner' as 'Query Executor', 
	now() as 'Query Date'
FROM
	airport join charter on airport.airport_code = charter.CHAR_DESTINATION
group by airport.airport_code
having count(*) > 2;