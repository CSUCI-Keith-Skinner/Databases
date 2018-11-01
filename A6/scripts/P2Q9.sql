#9. Construct a query to return aircrafts, their model codes and 
#   number of charters for charters to St. Louis or Atlanta. 
#   Order your results by total distance these aircrafts have flown.

USE AVIATIONCO;

select 
	aircraft.AC_NUMBER 		as 'Aircraft Number',
	aircraft.MOD_CODE		as 'Model Code',
    count(*)		as 'Number of Charters',
    sum(charter.CHAR_DISTANCE)	as 'Total Distance Travelled',
    'Keith Skinner'	as 'Query Executor',
    now()			as 'Query Date'
from charter join aircraft on charter.AC_NUMBER = aircraft.AC_NUMBER

where charter.CHAR_DESTINATION = 'STL' or charter.CHAR_DESTINATION = 'ATL'

group by aircraft.AC_NUMBER

order by `Total Distance Travelled` Desc;
	