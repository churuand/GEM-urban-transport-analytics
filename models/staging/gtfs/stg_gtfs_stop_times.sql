select
  feed_id,
  feed_id || ':' || trip_id as trip_key,
  feed_id || ':' || stop_id as stop_key,
  trip_id,
  stop_id,
  arrival_time,
  departure_time,
  try_cast(stop_sequence as integer) as stop_sequence,
  stop_headsign,
  try_cast(pickup_type as integer) as pickup_type,
  try_cast(drop_off_type as integer) as drop_off_type,
  try_cast(shape_dist_traveled as double) as shape_dist_traveled
from {{ source('raw_gtfs', 'gtfs_stop_times') }}
