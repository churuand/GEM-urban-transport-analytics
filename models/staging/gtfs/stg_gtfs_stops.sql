select
  feed_id,
  feed_id || ':' || stop_id as stop_key,
  feed_id || ':' || parent_station as parent_station_key,
  stop_id,
  stop_code,
  stop_name,
  try_cast(stop_lat as double) as stop_lat,
  try_cast(stop_lon as double) as stop_lon,
  stop_url,
  try_cast(location_type as integer) as location_type,
  parent_station,
  try_cast(wheelchair_boarding as integer) as wheelchair_boarding,
  level_id,
  platform_code
from {{ source('raw_gtfs', 'gtfs_stops') }}
