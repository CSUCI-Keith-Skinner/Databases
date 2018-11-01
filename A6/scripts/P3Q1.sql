use aviationco;
SELECT 	concat(EMP_FNAME, ' ', EMP_LNAME) as 'Employee Name', 
		'Keith Skinner' as 'Query Executor', 
		now() as 'Query Date'
FROM aviationco.employee
where EMP_DOB < '1970-00-01'
		AND EMP_TITLE = 'Ms.' ;