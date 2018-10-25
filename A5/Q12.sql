#Create the stored procedure `show_orders_by_date` that accepts a start date and end date as parameters and 
#  returns all order, product and vendor information for orders placed on or between those dates sorted by order date.
#  Capture all relevant information from order, item and vendor tables.

use airsupply;

DROP procedure if exists `show_orders_by_date`;

DELIMITER //
CREATE PROCEDURE `show_orders_by_date`(IN start DATE, IN end DATE)
	READS SQL DATA
BEGIN
	SELECT 
		`Order Id`,
        `Vendor Name`,
        `Product Name`,
        `Product Description`,
        `Product Price`,
        `Order Quantity`,
        `Cost Per Order`,
        `Accounts Payable Terms`,
        `Order Date`,
        `Arrival Date`,
        `Query Runner / Date`
    FROM `all_orders`#;
    WHERE 	DATEDIFF(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), start) >= 0
		AND	DATEDIFF(end, STR_TO_DATE(`Order Date`, '%m/%d/%Y')) >= 0
	ORDER BY `Arrival Date`;
END//
DELIMITER ;

CALL `show_orders_by_date`(STR_TO_DATE('06/21/2018', '%m/%d/%Y'), STR_TO_DATE('07/06/2018', '%m/%d/%Y'));