/*
==========================================================
DDL Script: Create Bronze Tables
==========================================================
Scripts Purposes:
  This script creates ta able in the 'bronze' schema, dropping existing tables
  If they already exist
  Run this script to redefine the DDL structure of 'Bronze' Tables
==========================================================
*/


--delete table if any data present in  BRONZE.crm_cust_info
if object_id('bronze.crm_cust_info','u') is not null
	drop table bronze.crm_cust_info;

--creating table BRONZE.crm_cust_info
CREATE TABLE BRONZE.crm_cust_info(
	cst_id int
   ,cst_key nvarchar(50)
   ,cst_firstname nvarchar(50)
   ,cst_lastname nvarchar(50)
   ,cst_material_status nvarchar(50)
   ,cst_gndr nvarchar(50)
   ,cst_create_date date
);

if object_id('bronze.crm_prd_info','u') is not null
	drop table bronze.crm_prd_info;
create table bronze.crm_prd_info(
	prd_id int
   ,prd_key nvarchar(50)
   ,prd_nm  nvarchar(50)
   ,prd_cost int
   ,prd_line nvarchar(50)
   ,prd_start_dt datetime
   ,prd_end_dt datetime
);

if object_id('bronze.crm_sales_details','u') is not null
	drop table bronze.crm_sales_details;
create table bronze.crm_sales_details(
	sls_ord_num nvarchar(50)
   ,sls_prd_key nvarchar(50)
   ,sls_cust_id int
   ,sls_order_dt int
   ,sls_ship_dt int
   ,sls_due_dt int
   ,sls_sales int
   ,sls_quantity int
   ,sls_price int
);


if object_id('bronze.erp_CUST_AZ12','u') is not null
	drop table bronze.erp_CUST_AZ12;

create table bronze.erp_CUST_AZ12(
	CID nvarchar(50)
   ,BDATE date
   ,GEN nvarchar(20)
);


if object_id('bronze.erp_LOC_A101','u') is not null
	drop table bronze.erp_LOC_A101;

create table bronze.erp_LOC_A101(
	CID nvarchar(50)
   ,CNTRY nvarchar(50)
);


if object_id('bronze.erp_PX_CAT_G1V2','u') is not null
	drop table bronze.erp_PX_CAT_G1V2;

create table bronze.erp_PX_CAT_G1V2(
	ID nvarchar(50)
   ,CAT nvarchar(50)
   ,SUBCAT nvarchar(50)
   ,MAINTENANCE nvarchar(50)
);

CREATE OR ALTER PROCEDURE bronze.load_source AS
BEGIN
	PRINT 'DATA LOADED SUCCESSFULLY';

	truncate table BRONZE.crm_cust_info;
	
	bulk insert BRONZE.crm_cust_info 
	from 'F:\Program\MS SQL server\Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with(
		firstrow = 2
	   ,fieldterminator = ','
	   ,tablock
	);
	
	truncate table bronze.crm_prd_info;
	
	bulk insert  bronze.crm_prd_info
	from 'F:\Program\MS SQL server\Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with(
		firstrow = 2
	   ,fieldterminator = ','
	   ,tablock
	);
	
	
	truncate table bronze.crm_sales_details;
	
	bulk insert bronze.crm_sales_details 
	from 'F:\Program\MS SQL server\Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with(
		firstrow = 2
	   ,fieldterminator = ','
	   ,tablock
	);
	
	truncate table bronze.erp_PX_CAT_G1V2;
	bulk insert bronze.erp_PX_CAT_G1V2
	from 'F:\Program\MS SQL server\Project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	with(
		firstrow = 2
	   ,fieldterminator = ','
	   ,tablock
	);
	
	truncate table bronze.erp_CUST_AZ12;
	
	bulk insert bronze.erp_CUST_AZ12
	from 'F:\Program\MS SQL server\Project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
	with(
		firstrow = 2
	   ,fieldterminator = ','
	   ,tablock
	);
	
	truncate table bronze.erp_LOC_A101;
	
	bulk insert bronze.erp_LOC_A101
	from 'F:\Program\MS SQL server\Project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	with(
		firstrow = 2
	   ,fieldterminator = ','
	   ,tablock
	);

END;

EXEC bronze.load_source;
