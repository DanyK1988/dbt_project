{{ config(materialized="table", schema="staging") }}

select city, region
from {{ ref("city_region") }}
