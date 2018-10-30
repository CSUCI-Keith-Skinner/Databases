#3.	Construct a query to select distinct aircraft models 
#   for aircrafts with chartered flights. 
#   Order by manufacturer ascending.
USE AVIATIONCO;
SELECT
	model.MOD_MANUFACTURER	as 'Model Manufacturer',
    model.MOD_NAME 			as 'MOD_NAME',
    'Keith Skinner'			as 'Query Executor',
    now() 					as 'Query Date'
FROM 
	charter join aircraft	on	aircraft.AC_NUMBER = charter.AC_NUMBER
			join model		on	aircraft.MOD_CODE  = model.MOD_CODE
GROUP BY model.MOD_CODE;