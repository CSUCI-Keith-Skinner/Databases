drop schema if exists airsupply;
create schema airsupply;
use airsupply;

drop table if exists input_file;
create table input_file (
	#260 is windows max 1016 is max for osx
	infile_path varchar(260) 
);

INSERT INTO input_file (infile_path)
VALUES();

drop table if exists nf1;
create table nf1 ( 
	order_id int,
	line_number int,	
	vendor_id int,
	vendor_name varchar(128),
	product_id int,
	product_name varchar(128),
	product_decription varchar(128),
	product_price float,
	order_quant float,
	cost_per_order float,
	accounts_payable_terms int,
	order_date date,
	arrival_date date
);

LOAD DATA LOCAL INFILE '<filename>'
INTO TABLE nf1
FIELDS TERMINATED BY ';' LINES terminated by '\r\n';
