CREATE TABLE IF NOT EXISTS songplays (
    songplay_id SERIAL PRIMARY KEY
    , start_time timestamptz NOT NULL
    , user_id integer NOT NULL
    , user_level varchar -- renamed from level due to keyword conflict
    , song_id varchar REFERENCES songs
    , artist_id varchar REFERENCES artists
    , session_id integer
    , songplay_location varchar -- renamed from location due to keyword conflict
    , user_agent varchar
);
