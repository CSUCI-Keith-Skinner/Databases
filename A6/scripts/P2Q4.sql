#4.	Construct a query to return the concatenated first and last name of 
#   employees along with their appropriate pilot ratings as shown below. 
#   Order by employee last name ascending.
USE AVIATIONCO;

SELECT 
	concat(employee.EMP_TITLE, ' ',
				employee.EMP_FNAME, ' ', 
                employee.EMP_LNAME)		as 'Employee Name',
    rating.RTG_NAME								as 'Rating',
    'Keith Skinner'										as 'Query Executor',
    NOW() 												as 'Query Date'
FROM
	pilot				JOIN 	employee		on 	pilot.EMP_NUM = employee.EMP_NUM
						JOIN	earnedrating	on	employee.EMP_NUM = earnedrating.EMP_NUM
						JOIN 	rating				on 	earnedrating.RTG_CODE = rating.RTG_CODE
ORDER BY
	employee.EMP_LNAME ASC;