select
  feed_id,
  feed_name
from {{ source('raw_gtfs', 'gtfs_feeds') }}
