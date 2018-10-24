drop schema if exists airsupply;
create schema airsupply;
use airsupply;

create table glob (
	order_id int(5) primary key,
    line_number int(1),
    vendor_id int(4),
    vendor_name varchar(64),
    product_id int(4),
    product_name varchar(64),
    product_description varchar(128),
    product_price float(8,2),
    order_quantity float(8, 2),
    cost_per_order varchar(10),
    accounts_payable_terms int(2),
    order_date DATE,
    arrival_date DATE
);

create table Vendor (
	vendor_id int(4),
    vendor_name varchar(64),
    primary key (vendor_id)
);

create table Product (
	product_id int(4),
    p_name varchar(32),
    p_description varchar(64),
    p_price float(8, 2),
    vendor_id int(4),
    primary key (product_id),
    foreign key (vendor_id)
		references Vendor (vendor_id)
);

create table OrderLine (
	line_num int(1),
	order_id int(5),
    product_id int(4),
    quantity float(8, 2),
    primary key (order_id, line_num),
    foreign key (product_id)
		references Product (product_id)
);

create table Orders (
	order_id int(5),
    line_num int(1),
    account_payable_terms int(2),
    order_date DATE,
    arrival_date DATE,
	primary key (order_id)
);

alter table Orders add
	foreign key (line_num)
		references OrderLine (line_num);

alter table OrderLine add constraint `orderline_ibfk_2`
	foreign key (order_id)
		references Orders (order_id);
    

-- load data local infile 'C:\\Users\\Keith\\GitHub\\Databases\\A5\\AirSupplyData-2018.csv'
-- 	INTO TABLE glob
-- 	FIELDS TERMINATED BY ','
--     LINES TERMINATED BY '\r\n'
-- 	IGNORE 1 LINES
-- (order_id, line_number, vendor_id, vendor_name, 
-- 	product_id, product_name, product_description, 
--     product_price, order_quantity, cost_per_order, 
--     accounts_payable_terms, @order_, @arrival_)
-- SET order_date = STR_TO_DATE(@order_, '%c/%e/%y'),
-- 	arrival_date = str_to_date(@arrival_, '%c/%e/%y');
    