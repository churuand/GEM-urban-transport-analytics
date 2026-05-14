select
  feed_id,
  feed_id || ':' || service_id as service_key,
  service_id,
  try_cast(monday as integer) as monday,
  try_cast(tuesday as integer) as tuesday,
  try_cast(wednesday as integer) as wednesday,
  try_cast(thursday as integer) as thursday,
  try_cast(friday as integer) as friday,
  try_cast(saturday as integer) as saturday,
  try_cast(sunday as integer) as sunday,
  strptime(start_date, '%Y%m%d')::date as start_date,
  strptime(end_date, '%Y%m%d')::date as end_date
from {{ source('raw_gtfs', 'gtfs_calendar') }}
