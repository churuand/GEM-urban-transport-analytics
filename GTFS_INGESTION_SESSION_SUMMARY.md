# GTFS Ingestion Session Summary

## Project Context

The dbt project is located at:

`D:\dbt_projects\test_projects`

The project uses DuckDB as its local database.

Active dbt profile:

`C:\Users\dangq\.dbt\profiles.yml`

Current target:

`dev`

DuckDB database file:

`D:\dbt_projects\test_projects\dev.duckdb`

## Source Data

The requested source folder was:

`D:\ATP\4. GRCG\Data project`

Only GTFS data was ingested.

GTFS source zip files were found in:

`D:\ATP\4. GRCG\Data project\gtfs\<feed_id>\google_transit.zip`

Feeds found:

`1, 2, 3, 4, 5, 6, 10, 11`

## Extraction Step

The GTFS zip files were extracted into:

`D:\ATP\4. GRCG\Data project\gtfs_extracted\<feed_id>\`

Each extracted feed contained standard GTFS `.txt` files such as:

- `agency.txt`
- `calendar.txt`
- `calendar_dates.txt`
- `levels.txt`
- `pathways.txt`
- `routes.txt`
- `shapes.txt`
- `stop_times.txt`
- `stops.txt`
- `transfers.txt`
- `trips.txt`

## Ingestion Script

A reusable ingestion SQL script was created at:

`D:\dbt_projects\test_projects\scripts\ingest_gtfs_raw.sql`

The script creates a `raw` schema and loads GTFS text files into DuckDB using `read_csv_auto`.

All fields were loaded as text using:

`all_varchar = true`

This avoids ingestion failures from mixed date, time, and ID formats. Type casting can be handled later in dbt transformation models.

## Execution Notes

The `duckdb` command-line tool was not available on PATH.

Instead, ingestion was executed using the project Python environment:

`D:\dbt_projects\.venv\Scripts\python.exe`

The installed DuckDB Python package version was:

`1.5.2`

The first ingestion attempt failed because the DuckDB database file was open in DBeaver:

`D:\Installed\DBeaver\dbeaver.exe`

DuckDB allows only one writer process at a time. After closing the DBeaver connection, ingestion succeeded.

## Tables Created

The following raw tables were created in DuckDB:

- `raw.gtfs_agency`
- `raw.gtfs_calendar`
- `raw.gtfs_calendar_dates`
- `raw.gtfs_levels`
- `raw.gtfs_pathways`
- `raw.gtfs_routes`
- `raw.gtfs_shapes`
- `raw.gtfs_stop_times`
- `raw.gtfs_stops`
- `raw.gtfs_transfers`
- `raw.gtfs_trips`

Each table includes a `feed_id` column identifying the source GTFS feed folder.

## Feed ID Fix

The first load produced blank `feed_id` values because the original extraction expression was too fragile for Windows path separators.

The ingestion script was updated to use a Windows-path regex:

```sql
regexp_extract(filename, 'gtfs_extracted\\([^\\]+)\\', 1) as feed_id
```

After reloading, `feed_id` values were correctly populated.

## Final Verification

Final row counts:

| Table | Row Count | Feed Count |
|---|---:|---:|
| `raw.gtfs_agency` | 8 | 8 |
| `raw.gtfs_calendar` | 7,126 | 8 |
| `raw.gtfs_calendar_dates` | 120,686 | 8 |
| `raw.gtfs_levels` | 22 | 8 |
| `raw.gtfs_pathways` | 4,432 | 4 |
| `raw.gtfs_routes` | 1,096 | 8 |
| `raw.gtfs_shapes` | 8,616,457 | 8 |
| `raw.gtfs_stop_times` | 13,616,134 | 8 |
| `raw.gtfs_stops` | 31,864 | 8 |
| `raw.gtfs_transfers` | 13,672 | 2 |
| `raw.gtfs_trips` | 359,043 | 8 |

`gtfs_pathways` and `gtfs_transfers` have fewer feed counts because not every GTFS feed contains rows for those files.

## Example Queries

Query loaded stops:

```sql
select *
from raw.gtfs_stops
limit 100;
```

Check row counts by feed:

```sql
select feed_id, count(*) as row_count
from raw.gtfs_stops
group by feed_id
order by cast(feed_id as integer);
```

## Current Status

GTFS data ingestion into local DuckDB is complete and verified.

Recommended next step: create dbt staging models under `models/staging/gtfs/` to clean data types, standardize names, and build analytical models from the raw GTFS tables.
