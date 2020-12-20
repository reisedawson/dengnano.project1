INSERT INTO songs (song_id, artist_id, title, song_year, duration)
VALUES (%s, %s, %s, %s, %s)
ON CONFLICT (song_id)
DO NOTHING;
