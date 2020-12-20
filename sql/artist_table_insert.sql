INSERT INTO artists (artist_id, artist_name, artist_location, latitude, longitude)
VALUES (%s, %s, %s, %s, %s)
ON CONFLICT (artist_id)
DO NOTHING;
