select
  s.stop_key,
  s.feed_id,
  f.feed_name,
  s.stop_id,
  s.stop_code,
  s.stop_name,
  s.stop_lat,
  s.stop_lon,
  s.location_type,
  s.parent_station,
  s.parent_station_key,
  s.wheelchair_boarding,
  s.level_id,
  s.platform_code
from {{ ref('stg_gtfs_stops') }} as s
left join {{ ref('stg_gtfs_feeds') }} as f
  on s.feed_id = f.feed_id
