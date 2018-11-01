#10.	Construct a query to return the average flight time for chartered flights with only 1 crew member (aka, solo pilots). 
#       Your query will use a group by to return charters with only 1 crew member and a virtual table to calculate the average.

use aviationco;
SELECT
	round(AVG(charter.CHAR_HOURS_FLOWN), 1) as 'Solo Pilots: Avg Hours Flown',
    'Keith Skinner' as 'Query Executor',
    now() as 'Query Date'
FROM
	(SELECT char_trip, count(*) as pilot_count FROM crew group by char_trip) temp join charter
		on temp.char_trip = charter.char_trip
WHERE pilot_count = 1;