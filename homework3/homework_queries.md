
-- Creating external table referring to gcs path

CREATE OR REPLACE EXTERNAL TABLE terraform-demo-448519.yellow_taxi_dataset.external_yellow_taxi_data OPTIONS ( format = 'PARQUET', uris = ['gs://yellow_taxi_data_2024/yellow_tripdata_2024-*.parquet'] );

-- Check yellow taxi data
SELECT * FROM terraform-demo-448519.yellow_taxi_dataset.external_yellow_taxi_data limit 10;

-- Create a regular  table from external table
CREATE OR REPLACE TABLE terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data AS SELECT * FROM terraform-demo-448519.yellow_taxi_dataset.external_yellow_taxi_data;

-- Count the recoreds of yellow_taxi table 

select count(*) as trips 
from terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data;

 -- query to count the distinct number of PULocationIDs for the entire dataset on both the tables.
SELECT COUNT(DISTINCT PULocationID) AS distinct_pulocation_count 
FROM `terraform-demo-448519.yellow_taxi_dataset.external_yellow_taxi_data`;

SELECT COUNT(DISTINCT PULocationID) AS distinct_pulocation_count 
FROM `terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data`;

-- query to retrieve the PULocationID and DOLocationID from table . (    155.12 MB)
SELECT PULocationID 
FROM `terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data`;

-- query to retrieve the PULocationID and DOLocationID from table . (    310.24 MB)

SELECT PULocationID, DOLocationID
FROM `terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data`;

-- count records have a fare_amount of 0
select count(*) as trips 
from terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data where fare_amount = 0; 

-- optomize the quesry by partion and cluster 
CREATE OR REPLACE TABLE `terraform-demo-448519.yellow_taxi_dataset.optimized_yellow_taxi_data`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT * FROM `terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data`;

-- query to retrieve the distinct VendorIDs between tpep_dropoff_datetime 2024-03-01 and 2024-03-15

SELECT DISTINCT VendorID
FROM `terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';


SELECT DISTINCT VendorID
FROM `terraform-demo-448519.yellow_taxi_dataset.optimized_yellow_taxi_data`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';

