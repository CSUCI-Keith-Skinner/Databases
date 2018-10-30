#6.	Construct a query to return the concatenated first and last name of employees
#      along with the count of their rating codes for employees with more than 3 ratings.
#      Order by their ratings count in descending order.

SELECT 
	concat(employee.EMP_TITLE, ' ',
				employee.EMP_FNAME, ' ', 
                employee.EMP_LNAME)		as 'Employee Name',
    count(*)												as 'Rating Count', 
    'Keith Skinner' 									as 'Query Executor',
    now() 													as 'Query Date'
FROM earnedrating join employee on earnedrating.EMP_NUM = employee.EMP_NUM

group by `Employee Name`
having `Rating Count` > 3
order by `Rating Count` DESC;
