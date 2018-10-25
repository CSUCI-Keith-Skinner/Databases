#Create the stored procedure `find_vendor_orders` that accepts vendor data
#  as input and produces a listing of orders placed with that vendor.

USE airsupply;

DROP PROCEDURE IF EXISTS `find_vendor_orders`;

DELIMITER //
CREATE PROCEDURE `find_vendor_orders`(IN vendor_name VARCHAR(64))
READS SQL DATA
BEGIN
	SELECT 
		`Vendor Name`,
        `Product Name`,
        `Product Price`,
        `Order Quantity`,
        `Cost Per Order`,
        `Accounts Payable Terms`,
        `Order Date`,
        `Arrival Date`,
        `Query Runner / Date`
    FROM
		`airsupply`.`all_orders`
	WHERE
		`Vendor Name` = vendor_name;
END//
DELIMITER ;

CALL `find_vendor_orders`('Hulkey Fasteners');