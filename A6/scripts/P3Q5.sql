use aviationco;

select
	RTG_NAME as 'Rating Name',
	'Keith Skinner' as 'Query Executor', 
	now() as 'Query Date'
FROM rating
WHERE RTG_NAME = (SELECT RTG_NAME from rating where RTG_CODE = 'SEL' LIMIT 1);