--Creating be;ow table under Datawarehouse.silver

CREATE OR REPLACE TABLE Datawarehouse.silver.crm_cust_info(
	cst_id int
   ,cst_key varchar(50)
   ,cst_firstname varchar(50)
   ,cst_lastname varchar(50)
   ,cst_material_status varchar(50)
   ,cst_gndr varchar(50)
   ,cst_create_date date
);


create OR REPLACE table Datawarehouse.silver.crm_prd_info(
	prd_id int
   ,prd_key varchar(50)
   ,cat_id varchar(50)
   ,prd_key1 varchar(50)
   ,prd_nm  varchar(50)
   ,prd_cost int
   ,prd_line varchar(50)
   ,prd_start_dt date
   ,prd_end_dt date
   ,PRD_END_DT_TEST date
);

create OR REPLACE table Datawarehouse.silver.crm_sales_details(
	sls_ord_num varchar(50)
   ,sls_prd_key varchar(50)
   ,sls_cust_id int
   ,sls_order_dt int
   ,sls_ship_dt int
   ,sls_due_dt int
   ,sls_sales int
   ,sls_quantity int
   ,sls_price int
);


create OR REPLACE table Datawarehouse.silver.erp_CUST_AZ12(
	CID varchar(50)
   ,DATE DATE
   ,GEN varchar(20)
);


create OR REPLACE table Datawarehouse.silver.erp_LOC_A101(
	CID varchar(50)
   ,CNTRY varchar(50)
);



create OR REPLACE table Datawarehouse.silver.erp_PX_CAT_G1V2(
	ID varchar(50)
   ,CAT varchar(50)
   ,SUBCAT varchar(50)
   ,MAINTENANCE varchar(50)
);
