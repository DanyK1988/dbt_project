{{ config(materialized="table") }}

select ticket_no, flight_id, fare_conditions, amount, now() as loaded_at
from {{ ref("stg_flights__ticket_flights") }}
