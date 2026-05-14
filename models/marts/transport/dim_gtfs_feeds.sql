select
  feed_id,
  feed_name
from {{ ref('stg_gtfs_feeds') }}
