#Create the view `all_orders` that recreates the output found in AirSupplyData-2018.xlsx.

USE airsupply;

DROP VIEW IF EXISTS `all_orders`;
CREATE VIEW  `all_orders` AS
	SELECT 
		Orders.order_id 								AS "Order Id",
        OrderLine.line_number 							AS "Line Number",
        Vendor.vendor_id 								AS "Vendor Id",
        Vendor.name 									AS "Vendor Name",
        Product.product_id 								AS "Product Id",
        Product.name 									AS "Product Name",
        Product.description								AS "Product Description",
        Product.price									AS "Product Price",
        OrderLine.quantity								AS "Order Quantity",
        Product.price*OrderLine.quantity				AS "Cost Per Order",
        Orders.ap_terms									AS "Accounts Payable Terms",
        DATE_FORMAT(Orders.order_date, '%m/%d/%Y')		AS "Order Date",
        DATE_FORMAT(Orders.arrival_date, '%m/%d/%Y')	AS "Arrival Date",
        query_runner() 									AS "Query Runner / Date"
	FROM
		Orders	JOIN OrderLine 	ON Orders.order_id = OrderLine.order_id
				JOIN Product 	ON OrderLine.product_id = Product.product_id
				JOIN Vendor 	ON Product.vendor_id = Vendor.vendor_id
	ORDER BY Orders.order_id;

SELECT * FROM `all_orders`;
