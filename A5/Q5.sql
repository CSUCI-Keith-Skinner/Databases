#Create the view `vendor_purchases` that returns a listing of vendors and 
#  the total amount of purchases made through that vendor. 
#  Sort your results from largest to smallest overall dollar amount.

USE airsupply;

DROP VIEW IF EXISTS `vendor_purchases`;
CREATE VIEW `vendor_purchases` AS
	SELECT
        Vendor.name as "Vendor Name",
		sum(Product.price * OrderLine.quantity) as "Amount Purchesed",
        query_runner() as "Query Runner / Date"
	FROM		OrderLine
				JOIN Product 	ON OrderLine.product_id = Product.product_id
				JOIN Vendor 	ON Product.vendor_id = Vendor.vendor_id
	GROUP BY Vendor.vendor_id
    ORDER BY sum(Product.price * OrderLine.quantity) DESC;

SELECT * from `vendor_purchases`;