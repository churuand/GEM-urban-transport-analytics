select
  feed_id,
  feed_id || ':' || route_id as route_key,
  feed_id || ':' || agency_id as agency_key,
  route_id,
  agency_id,
  route_short_name,
  route_long_name,
  try_cast(route_type as integer) as route_type,
  route_color,
  route_text_color
from {{ source('raw_gtfs', 'gtfs_routes') }}
