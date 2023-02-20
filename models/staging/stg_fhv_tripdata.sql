{{ config(materialized='view') }}

select
    -- identifiers
    dispatching_base_num ,
    -- cast(ratecodeid as integer) as ratecodeid,
    cast(PUlocationID as integer) as  pickup_locationid,
    cast(DOlocationID as integer) as dropoff_locationid,
    SR_Flag,
    Affiliated_base_number,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime
    

from {{ source('staging','fhv_partitioned_tripdata') }}


-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
