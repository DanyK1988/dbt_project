{{ config(materialized="table") }}

select book_ref, book_date, total_amount, now() as loaded_at
from {{ ref("stg_flights__bookings") }}
