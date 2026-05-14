select distinct
  feed_id,
  feed_id || ':' || trip_id as trip_key,
  feed_id || ':' || route_id as route_key,
  feed_id || ':' || service_id as service_key,
  feed_id || ':' || shape_id as shape_key,
  route_id,
  service_id,
  trip_id,
  shape_id,
  trip_headsign,
  try_cast(direction_id as integer) as direction_id,
  block_id,
  try_cast(wheelchair_accessible as integer) as wheelchair_accessible,
  try_cast(bikes_allowed as integer) as bikes_allowed
from {{ source('raw_gtfs', 'gtfs_trips') }}
