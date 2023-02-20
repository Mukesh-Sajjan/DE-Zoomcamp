-- Question 1
select count(*) from `ny-rides-mukesh.dbt_msajjan.fact_trips`
where extract(year from pickup_datetime) in (2019,2020);

-- Question 2
select service_type, count(*) /(sum(count(*)) OVER()) as pct from `ny-rides-mukesh.dbt_msajjan.fact_trips`
where extract(year from pickup_datetime) in (2019,2020)
group by service_type

-- Question 3
select count(*) from `ny-rides-mukesh.dbt_msajjan.stg_fhv_tripdata`
where extract(year from pickup_datetime) = 2019

-- Question 4
select count(*) from `dbt_msajjan.fhv_fact_trips`
where extract(year from pickup_datetime) = 2019

-- Question 5
select extract(month from pickup_datetime) as month, count(*) from `dbt_msajjan.fhv_fact_trips`
group by extract(month from pickup_datetime)


