CREATE TABLE IF NOT EXISTS artists (
    artist_id varchar NOT NULL PRIMARY KEY
    , artist_name varchar NOT NULL -- renamed from name due to keyword conflict
    , artist_location varchar -- renamed from location due to keyword conflict
    , latitude numeric
    , longitude numeric
);
