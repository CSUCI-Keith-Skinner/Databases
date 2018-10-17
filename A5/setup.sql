drop schema if exists airsupply;
create schema airsupply;
use airsupply;

drop table if exists input_file;
create table input_file (
	#260 is windows max 1016 is max for osx
	infile_path varchar(260) 
);

drop table if exists nf1;
create table nf1 ( 
	order_id int,
	line_number int,	
	vendor_id int,
	vendor_name varchar(),
	product_id int,
	product_name varchar(),
	product_decription varchar(),
	product_price float,
	order_quant float,
	cost_per_order float,
	accounts_payable_terms int,
	order_date date,
	arrival_date date
);

