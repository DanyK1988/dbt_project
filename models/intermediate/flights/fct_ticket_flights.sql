{{ config(materialized="table", contract={"enforced": true}) }}

select ticket_no, flight_id, fare_conditions, amount, now() as loaded_at
from {{ ref("stg_flights__ticket_flights") }}
where
    ticket_no not in (
        select t.ticket_no
        from {{ ref("stg_flights__tickets") }} t
        inner join {{ ref("passanger_id") }} p on t.passenger_id = p.passenger_id
    )
