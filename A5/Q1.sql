#Create a normalized database to 3NF for the transactional data found in AirSupplyData-2018.xlsx. 
#  Reverse engineer your database in MySQL Workbench and paste the result below. 

DROP SCHEMA IF EXISTS airsupply;
CREATE SCHEMA airsupply;
USE airsupply;

CREATE TABLE Vendor (
	vendor_id INT(4),
    name VARCHAR(64) NOT NULL,
    PRIMARY KEY (vendor_id)
);

CREATE TABLE Product (
	product_id INT(4),
    name VARCHAR(32) NOT NULL,
    description VARCHAR(64),
    price FLOAT(8, 2) NOT NULL,
    vendor_id INT(4),
    PRIMARY KEY (product_id),
    FOREIGN KEY (vendor_id)
		REFERENCES Vendor (vendor_id)
);

CREATE TABLE Orders(
	order_id INT(5),
    ap_terms INT(2) NOT NULL,
    order_date DATE NOT NULL,
    arrival_date DATE,
	PRIMARY KEY (order_id)
);

CREATE TABLE OrderLine (
	line_number INT(1),
	order_id INT(5) NOT NULL,
    product_id INT(4) NOT NULL,
    quantity FLOAT(8, 2) NOT NULL,
    PRIMARY KEY (line_number, order_id),
    FOREIGN KEY (product_id)
		REFERENCES Product (product_id),
	FOREIGN KEY (order_id)
		REFERENCES Orders (order_id)
);

DROP FUNCTION IF EXISTS query_runner;
DELIMITER //
	CREATE FUNCTION query_runner() 
    RETURNS VARCHAR(64)
    READS SQL DATA
    DETERMINISTIC
    BEGIN
    
    return concat("Queried by Keith Skinner on ", now());
    
    END//
DELIMITER ;
