select
  CUSTOMER_ID          as customer_id,
  ORDER_DATE           as order_date,
  STATUS               as status,
  __HEVO__INGESTED_AT  as hevo_ingested_at
from {{ source('hevo_raw', 'SNOWFLAKE_DESTINATION_RAW_ORDERS') }}
where __HEVO__MARKED_DELETED = false
