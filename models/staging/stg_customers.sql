select
  CUSTOMER_ID        as customer_id,
  FIRST_NAME         as first_name,
  LAST_NAME          as last_name,
  __HEVO__INGESTED_AT as hevo_ingested_at
from {{ source('hevo_raw', 'SNOWFLAKE_DESTINATION_RAW_CUSTOMERS') }}
where __HEVO__MARKED_DELETED = false
