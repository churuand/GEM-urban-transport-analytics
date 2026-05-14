select
  t.trip_key,
  t.route_key,
  t.service_key,
  t.shape_key,
  t.feed_id,
  f.feed_name,
  t.route_id,
  t.service_id,
  t.trip_id,
  t.shape_id,
  t.trip_headsign,
  t.direction_id,
  t.block_id,
  t.wheelchair_accessible,
  t.bikes_allowed
from {{ ref('stg_gtfs_trips') }} as t
left join {{ ref('stg_gtfs_feeds') }} as f
  on t.feed_id = f.feed_id
