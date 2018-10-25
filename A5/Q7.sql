#Create the view `vendor_shipping_stats` that produces a listing of 
#  the average ship times for each vendor. 
#  Sort the results by longest to shortest duration.

USE airsupply;

DROP VIEW IF EXISTS `vendor_shipping_stats`;
CREATE VIEW `vendor_shipping_stats` AS
	SELECT 
		`Vendor Name`,
        AVG(DATEDIFF(STR_TO_DATE(`Arrival Date`, '%m/%d/%Y'), STR_TO_DATE(`Order Date`, '%m/%d/%Y')))
			AS 'Average Ship Times',
		`Query Runner / Date`
	FROM `airsupply`.`all_orders`
    GROUP BY `airsupply`.`all_orders`.`Vendor Name`
    ORDER BY AVG(DATEDIFF(STR_TO_DATE(`Arrival Date`, '%m/%d/%Y'), STR_TO_DATE(`Order Date`, '%m/%d/%Y')))
			DESC;

SELECT * FROM `vendor_shipping_stats`;