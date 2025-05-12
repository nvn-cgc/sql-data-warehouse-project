# sql-data-warehouse-project
Building a modern data warehouse with Snowflake, including ETL processes, data modeling, and analytics.

I am using Medallion Architecture (also known as the Bronze-Silver-Gold data model). In this model, I am creating three schemas: BRONZE, SILVER, and GOLD.

The Medallion Architecture is a layered data design pattern that organizes data processing in stages, improving data quality, traceability, and maintainability in ETL pipelines. It is commonly used in data lakes, data warehouses, and modern ELT frameworks like Snowflake, Databricks, and dbt.

Bronze: Data lands from internal/local systems, and no logic is applied.
Silver: Apply validation, joins, type casting, transformations and after that insert data into silver layer 
Gold: Aggregate, summarize, and prepare for BI/ML usage.
