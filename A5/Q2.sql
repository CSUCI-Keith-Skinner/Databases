#Construct n bulk insert statements (1 per entity) to insert the data found in AirSupplyData-2018.xlsx. 
#  Note: Data cleansing may be required. Do not include data for derived attributes.

USE airsupply;

LOAD DATA LOCAL INFILE 'C:\\Users\\Keith\\GitHub\\Databases\\A5\\AirSupplyData-2018.csv'
	INTO TABLE Vendor
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (@order_id, @line_number, @vendor_id, @vendor_name, 
		@product_id, @product_name, @product_description, 
		@product_price, @order_quantity, @cost_per_order, 
		@accounts_payable_terms, @order_date, @arrival_date)
	SET vendor_id = @vendor_id,
		name = @vendor_name;
        
SELECT * FROM Vendor;
        
LOAD DATA LOCAL INFILE 'C:\\Users\\Keith\\GitHub\\Databases\\A5\\AirSupplyData-2018.csv'
	INTO TABLE Product
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
		(@order_id, @line_number, @vendor_id, @vendor_name, 
			@product_id, @product_name, @product_description, 
			@product_price, @order_quantity, @cost_per_order, 
			@accounts_payable_terms, @order_date, @arrival_date)
	SET product_id = @product_id,
		name = @product_name,
        description = @product_description,
        price = @product_price,
        vendor_id = @vendor_id;
        
SELECT * FROM Product;

LOAD DATA LOCAL INFILE 'C:\\Users\\Keith\\GitHub\\Databases\\A5\\AirSupplyData-2018.csv'
	INTO TABLE Orders
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
	(	@order_id, @line_number, @vendor_id, @vendor_name, 
		@product_id, @product_name, @product_description, 
		@product_price, @order_quantity, @cost_per_order, 
		@accounts_payable_terms, @order_date, @arrival_date)
	SET order_id = @order_id,
		ap_terms = @accounts_payable_terms,
        order_date = STR_TO_DATE(@order_date, '%c/%e/%y'),
        arrival_date = STR_TO_DATE(@arrival_date, '%c/%e/%y');
        
SELECT * FROM Orders;
        
LOAD DATA LOCAL INFILE 'C:\\Users\\Keith\\GitHub\\Databases\\A5\\AirSupplyData-2018.csv'
	INTO TABLE OrderLine
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
	(	@order_id, @line_number, @vendor_id, @vendor_name, 
		@product_id, @product_name, @product_description, 
		@product_price, @order_quantity, @cost_per_order, 
		@accounts_payable_terms, @order_date, @arrival_date)
	SET line_number = @line_number,
		order_id = @order_id,
        product_id = @product_id,
        quantity = @order_quantity;
	
SELECT * FROM OrderLine;