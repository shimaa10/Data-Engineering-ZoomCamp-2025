# Data-Engineering-ZoomCamp-2025
Data Engineering ZoomCamp 2025





CREATE OR REPLACE EXTERNAL TABLE `terraform-demo-448519.yellow_taxi_dataset.external_yellow_taxi_data`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://yellow_taxi_data_2024/yellow_tripdata_2024-*.parquet']
);

SELECT * FROM terraform-demo-448519.yellow_taxi_dataset.external_yellow_taxi_data limit 10;


CREATE OR REPLACE TABLE terraform-demo-448519.yellow_taxi_dataset.regular_yellow_taxi_data AS
SELECT * FROM terraform-demo-448519.yellow_taxi_dataset.external_yellow_taxi_data;

