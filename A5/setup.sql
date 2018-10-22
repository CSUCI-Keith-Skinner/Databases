drop schema if exists airsupply;
create schema airsupply;
use airsupply;


drop table if exists glob;
create table glob (
	order_id int primary key,
    line_number int,
    vendor_id int,
    vendor_name varchar(64),
    product_id int,
    product_name varchar(64),
    product_description varchar(128),
    product_price float(8,2),
    order_quantity float(10, 2),
    cost_per_order float(10, 2),
    accounts_payable_terms int,
    order_date DATE,
    arrival_date DATE
);

load data local infile 'C:\\Users\\Keith\\GitHub\\Databases\\AirSupplyData-2018 - Sheet3.csv'
	INTO TABLE glob
	FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\r\n';