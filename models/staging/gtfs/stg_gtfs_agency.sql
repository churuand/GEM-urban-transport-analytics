select
  feed_id,
  feed_id || ':' || agency_id as agency_key,
  agency_id,
  agency_name,
  agency_url,
  agency_timezone,
  agency_lang,
  agency_fare_url
from {{ source('raw_gtfs', 'gtfs_agency') }}
