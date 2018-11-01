use aviationco;

select 
	concat(customer.CUS_FNAME, ' ', customer.CUS_LNAME) as 'Customer Name',
    airport.city as 'Destination City',
    charter.CHAR_DATE as 'Flight Time',
	'Keith Skinner' as 'Query Executor',
    now() as 'Query Date'
from	customer	join charter on customer.cus_code = charter.cus_code
					join airport on charter.CHAR_DESTINATION = airport.airport_code; 