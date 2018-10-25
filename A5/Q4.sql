#Create the view `vendor_product_count` that returns a listing of vendors
#  and the number of products provided by each vendor. 
#  Sort your results high to low. 

USE airsupply;

DROP VIEW IF EXISTS `vendor_product_count`;
CREATE VIEW  `vendor_product_count` AS
	SELECT 
		Vendor.name as "Vendor Name",
		count(*) as "Number of Products",
        query_runner() as "Query Runner / Date"
	FROM
		Product JOIN Vendor on Product.vendor_id = Vendor.vendor_id
	GROUP BY Vendor.vendor_id
    order by count(*) DESC;
    
    
SELECT * from `vendor_product_count`;