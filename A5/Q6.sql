#Create the view `payments` that outputs the future dates for when payments are due. 
#  Use the accounts  / payable terms to determine the last date for payment. 
#  Capture all relevant information from order, item and vendor tables. 

USE airsupply;

DROP VIEW IF EXISTS `payments`;
CREATE VIEW `payments` AS

    SELECT 
		`Product Name`,
        `Vendor Name`,
        `Product Price`,
        `Order Quantity`,
        `Cost Per Order`,
        `Order Date`,
        `Accounts Payable Terms`,
        DATE_FORMAT(DATE_ADD(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), INTERVAL `Accounts Payable Terms` DAY), '%m/%d/%Y')
			AS 'Payment Due',
		`Arrival Date`,
        `Query Runner / Date`
    FROM `airsupply`.`all_orders`;

SELECT * FROM `payments`;
	