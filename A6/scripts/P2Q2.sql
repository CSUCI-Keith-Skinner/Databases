#2.	Construct a query to return the concatenated first and last names of pilots
#   along with their license and ratings for all commercial pilots.
#   Order by employee last name.
USE AVIATIONCO;
SELECT 
	concat(employee.EMP_TITLE, ' ', 
		   employee.EMP_FNAME, ' ',
           employee.EMP_LNAME)									as 'Employee Name',
    pilot.PIL_LICENSE 											as 'Pilot License',
    earnedrating.RTG_CODE 										as 'Pilot Ratings',
    'Keith Skinner' 											as 'Query Executor',
    now() 														as 'Query Date'
FROM earnedrating join pilot on pilot.EMP_NUM = earnedrating.EMP_NUM
			  join employee on earnedrating.EMP_NUM = employee.EMP_NUM
ORDER BY employee.EMP_LNAME;
