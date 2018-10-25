#Create the stored procedure `show_product_pricing` that accepts an item description as input
#  and returns a listing of vendors and their prices for that specific product.
#  Sort results by item cost low to high.

USE airsupply;

DROP procedure if exists `show_product_pricing`;

DELIMITER //
CREATE PROCEDURE `show_product_pricing`(IN item_name VARCHAR(32))
READS SQL DATA
BEGIN
	SELECT
        `Product Name`,
        `Vendor Name`,
        `Vendor Id`,
        `Product Id`,
        `Product Price`,
        `Query Runner / Date`
    FROM `all_orders`
    WHERE `Product Name` = item_name
    GROUP BY `Product Id`
    ORDER BY `Product Price`;
END//
DELIMITER ;

CALL `show_product_pricing`('Airframe fasteners');