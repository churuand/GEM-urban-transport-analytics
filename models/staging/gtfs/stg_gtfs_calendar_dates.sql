select
  feed_id,
  feed_id || ':' || service_id as service_key,
  service_id,
  strptime(date, '%Y%m%d')::date as service_date,
  try_cast(exception_type as integer) as exception_type
from {{ source('raw_gtfs', 'gtfs_calendar_dates') }}
