select
  st.feed_id,
  f.feed_name,
  st.trip_key,
  st.stop_key,
  st.trip_id,
  st.stop_id,
  st.stop_sequence,
  st.arrival_time,
  st.departure_time,
  st.pickup_type,
  st.drop_off_type,
  st.shape_dist_traveled
from {{ ref('stg_gtfs_stop_times') }} as st
left join {{ ref('stg_gtfs_feeds') }} as f
  on st.feed_id = f.feed_id
