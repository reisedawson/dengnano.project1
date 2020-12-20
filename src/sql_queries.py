# DROP TABLES

songplay_table_drop = open('sql/songplay_table_drop.sql', 'r').read()
user_table_drop = open('sql/user_table_drop.sql', 'r').read()
song_table_drop = open('sql/song_table_drop.sql', 'r').read()
artist_table_drop = open('sql/artist_table_drop.sql', 'r').read()
time_table_drop = open('sql/time_table_drop.sql', 'r').read()

# CREATE TABLES

songplay_table_create = open('sql/songplay_table_create.sql', 'r').read()
user_table_create = open('sql/user_table_create.sql', 'r').read()
song_table_create = open('sql/song_table_create.sql', 'r').read()
artist_table_create = open('sql/artist_table_create.sql', 'r').read()
time_table_create = open('sql/time_table_create.sql', 'r').read()

# INSERT RECORDS

songplay_table_insert = open('sql/songplay_table_insert.sql', 'r').read()
user_table_insert = open('sql/user_table_insert.sql', 'r').read()
song_table_insert = open('sql/song_table_insert.sql', 'r').read()
artist_table_insert = open('sql/artist_table_insert.sql', 'r').read()
time_table_insert = open('sql/time_table_insert.sql', 'r').read()

# FIND SONGS

song_select = open('sql/song_select.sql', 'r').read()

# QUERY LISTS

create_table_queries = [user_table_create, song_table_create,
                        artist_table_create, time_table_create,
                        songplay_table_create]
drop_table_queries = [user_table_drop, song_table_drop, artist_table_drop,
                      time_table_drop, songplay_table_drop]
