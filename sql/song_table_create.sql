CREATE TABLE IF NOT EXISTS songs (
    song_id varchar NOT NULL PRIMARY KEY
    , artist_id varchar NOT NULL
    , title varchar NOT NULL
    , song_year integer -- renamed from year due to keyword conflict
    , duration numeric
);
