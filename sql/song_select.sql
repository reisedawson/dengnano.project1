SELECT 
    song_id
    , songs.artist_id
FROM
    songs
JOIN
    artists ON songs.artist_id = artists.artist_id
WHERE title = %s AND artist_name = %s AND duration = %s;
