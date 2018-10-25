#Create the stored procedure `show_vendor_purchases` that accepts a vendor number as input and 
#  returns the total cost of goods purchased through that vendor. 
#  Sort by the total cost highest to lowest and capture all relevant information from order, item and vendor tables.

USE airsupply;

DROP PROCEDURE IF EXISTS `show_vendor_purchases`;

DELIMITER //
CREATE PROCEDURE `show_vendor_purchases`(IN vendor_number INT(4))
READS SQL DATA
BEGIN
	SELECT 
		`Vendor Name`,
        `Order Id`,
        `Product Name`,
        `Product Price`,
        `Order Quantity`,
        `Cost Per Order`,
        `Query Runner / Date`
    FROM
		`airsupply`.`all_orders`
	WHERE
		`Vendor Id` = vendor_number
	ORDER BY
		`Cost Per Order` DESC;
END//
DELIMITER ;

CALL `show_vendor_purchases`('1004');