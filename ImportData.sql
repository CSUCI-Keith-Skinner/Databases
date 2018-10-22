drop schema if exists airsupply;
create schema airsupply;
use airsupply;

drop table if exists vendor;
create table vendor (
    vendor_id int primary key,
    vendor_name varchar(64),
    ap_terms int
);

load data local infile "C:\\Users\\Keith\\GitHub\\Databases\\AirSupplyData-2018 - Sheet3.csv";
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';