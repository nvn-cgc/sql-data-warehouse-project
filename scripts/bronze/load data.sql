/*
  ====================================================================================
  Stored procedure: Load bronze layer(Source -> bronze)
  ====================================================================================

  scripts purposes: 
    This stored procedure loads data from external CSV files into the 'bronze' schema.
    It performs the following actions:
      - Truncates the bronze tables before loading data.
      - Uses the BULK INSERT command to load data from CSV files to bronze tables.
  ====================================================================================
*/

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
