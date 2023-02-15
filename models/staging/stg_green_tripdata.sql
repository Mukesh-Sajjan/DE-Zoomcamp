{{ config(materialized='view') }}

select * from {{ source('staging','fhv_partitioned_tripdata') }}
limit 100