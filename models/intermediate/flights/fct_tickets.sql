{{ config(materialized="table") }}
select
    ticket_no, book_ref, passenger_id, passenger_name, contact_data, now() as loaded_at
from {{ ref("stg_flights__tickets") }}
