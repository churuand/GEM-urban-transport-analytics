select
  r.route_key,
  r.feed_id,
  f.feed_name,
  r.route_id,
  r.agency_id,
  r.route_short_name,
  r.route_long_name,
  r.route_type,
  r.route_color,
  r.route_text_color
from {{ ref('stg_gtfs_routes') }} as r
left join {{ ref('stg_gtfs_feeds') }} as f
  on r.feed_id = f.feed_id
