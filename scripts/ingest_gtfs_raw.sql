create schema if not exists raw;

create or replace table raw.gtfs_feeds as
select *
from (values
  ('1', 'Regional Train'),
  ('2', 'Metropolitan Train'),
  ('3', 'Metropolitan Tram'),
  ('4', 'myki Bus (Metro Bus and Regional Town Bus)'),
  ('5', 'Regional Coach'),
  ('6', 'Regional Bus'),
  ('10', 'Interstate Train'),
  ('11', 'SkyBus')
) as feeds(feed_id, feed_name);

create or replace table raw.gtfs_agency as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/agency.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_calendar as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/calendar.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_calendar_dates as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/calendar_dates.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_levels as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/levels.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_pathways as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/pathways.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_routes as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/routes.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_shapes as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/shapes.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_stop_times as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/stop_times.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_stops as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/stops.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_transfers as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/transfers.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);

create or replace table raw.gtfs_trips as
select
  regexp_extract(replace(filename, chr(92), '/'), 'gtfs_extracted/([^/]+)/', 1) as feed_id,
  * exclude (filename)
from read_csv_auto(
  'D:/ATP/4. GRCG/Data project/gtfs_extracted/*/trips.txt',
  header = true,
  all_varchar = true,
  normalize_names = true,
  union_by_name = true,
  filename = true
);
