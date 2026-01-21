select
  PAYMENT_ID           as payment_id,
  CUSTOMER_ID          as customer_id,
  AMOUNT               as amount,
  PAYMENT_METHOD       as payment_method,
  __HEVO__INGESTED_AT  as hevo_ingested_at
from {{ source('hevo_raw', 'SNOWFLAKE_DESTINATION_RAW_PAYMENTS') }}
where __HEVO__MARKED_DELETED = false
