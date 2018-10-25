#Create the stored procedure `find_products` that accepts a vendor number as input and 
#  outputs all relevant product information for products manufactured by that vendor, 
#  including item number, description and cost. Sort by vendor lowest to highest.

USE airsupply;

DROP PROCEDURE IF EXISTS `find_products`;

DELIMITER //
CREATE PROCEDURE `find_products`(IN vendor_number INT(4))
READS SQL DATA
BEGIN
	SELECT 
		`Vendor Name`,
        `Product Id`,
        `Product Name`,
        `Product Description`,
        `Product Price`,
        `Query Runner / Date`
    FROM
		`airsupply`.`all_orders`
	WHERE vendor_number = `Vendor Id`
	GROUP BY `Product Id`
    ORDER BY `Vendor Id`;
END//
DELIMITER ;

CALL `find_products`('1004');
