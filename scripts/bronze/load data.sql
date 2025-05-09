/*
  ====================================================================================
  SnowSQL: Load bronze layer(Source(locally stored) -> bronze)
  ====================================================================================

  scripts purposes: 
    It uploads (or "stages") local files from your computer to Snowflake to be loaded into tables later.
    It performs the following actions:
      - We are using the PUT command to upload the data into stages
		PUT file://<local_file_path> @<stage_name> [AUTO_COMPRESS = TRUE|FALSE] [OVERWRITE = TRUE|FALSE];
      - We are using the COPY INTO command to copy data from the stage to the table in Snowflake
		COPY INTO <table_name>
		FROM <stage_location>
		[ FILES = ('file1.csv', 'file2.csv') ]
		[ FILE_FORMAT = (TYPE = 'CSV' [other options]) ]
		[ ON_ERROR = 'CONTINUE' | 'SKIP_FILE' | 'SKIP_FILE_<num>' | 'ABORT_STATEMENT' ]
		[ FORCE = TRUE | FALSE ];
      - After loading data into a table, we can able to retrieve from the below-mentioned query
		SELECT * FROM INFORMATION_SCHEMA.LOAD_HISTORY WHERE TABLE_NAME = 'CRM_CUST_INFO';

  ====================================================================================
*/

--this needs to be run in SNOWSQL
PUT file://F:/Program/MS_SQL_server/Project/sql_data_warehouse_project/datasets/source_crm/cust_info.csv @%crm_cust_info;

--this needs to be run in snowflake
COPY INTO crm_cust_info
FROM @%crm_cust_info
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

select * from crm_cust_info;

PUT file://F:/Program/MS_SQL_server/Project/sql_data_warehouse_project/datasets/source_crm/prd_info.csv @%crm_prd_info;


COPY INTO crm_prd_info
from @%crm_prd_info
file_format = (type = 'csv' skip_header = 1 field_optionally_enclosed_by = '"');

select * from crm_prd_info;

PUT file://F:/Program/MS_SQL_server/Project/sql_data_warehouse_project/datasets/source_crm/sales_details.csv @%crm_sales_details;

Copy into crm_sales_details
from @%crm_sales_details
file_format = (type = 'csv' skip_header = 1 field_optionally_enclosed_by = '"');

select * from crm_sales_details;

PUT file://F:/Program/MS_SQL_server/Project/sql_data_warehouse_project/datasets/source_crm/cust_az12.csv @%erp_cust_az12;

Copy into erp_cust_az12
from @%erp_cust_az12
file_format = (type = 'csv' skip_header = 1 field_optionally_enclosed_by = '"');

PUT file://F:/Program/MS_SQL_server/Project/sql_data_warehouse_project/datasets/source_crm/loc_a101.csv @%erp_loc_a101;

Copy into erp_loc_a101
from @%erp_loc_a101
file_format = (type = 'csv' skip_header = 1 field_optionally_enclosed_by = '"');

PUT file://F:/Program/MS_SQL_server/Project/sql_data_warehouse_project/datasets/source_crm/px_cat_g1v2.csv @%erp_px_cat_g1v2;

copy into erp_px_cat_g1v2
from @%erp_px_cat_g1v2
file_format = (type = 'csv' skip_header = 1 field_optionally_enclosed_by = '"');

