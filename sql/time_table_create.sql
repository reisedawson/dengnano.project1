CREATE TABLE IF NOT EXISTS dim_time (
    start_time timestamptz NOT NULL PRIMARY KEY
    , start_hour smallint NOT NULL --renamed from hour due to keyword conflict
    , start_day smallint NOT NULL --renamed from day due to keyword conflict
    , start_week smallint NOT NULL -- renamed from week for consistency
    , start_month smallint NOT NULL --renamed from month due to keyword conflict
    , start_year smallint NOT NULL --renamed from year due to keyword conflict
    , start_weekday smallint NOT NULL -- renamed from weekday for consistency
);
