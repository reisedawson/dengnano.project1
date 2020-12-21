# Data Engineering Nanodegree - Project 1
## Data Modelling with Postgres

This is the first project issued as part of Udacity's Data Engineering Nanodegree program.

Sparkify is a startup that provides a music streaming app. They want to analyse the data that they have so far been collecting. 
The data sources that we will be working with are 2 directories of JSON data. 

The first data source is a directory of metadata on songs from the app organised into folders based on the first 3 letters of the songs ID. Here is an example song file:

	{
        "num_songs": 1, 
        "artist_id": "ARJIE2Y1187B994AB7", 
        "artist_latitude": null, 
        "artist_longitude": null, 
        "artist_location": "", 
        "artist_name": "Line Renaud", 
        "song_id": "SOUPIRU12A6D4FA1E1", 
        "title": "Der Kleine Dompfaff", 
        "duration": 152.92036, 
        "year": 0
    }

    
`{"num_songs": 1, "artist_id": "ARJIE2Y1187B994AB7", "artist_latitude": null, "artist_longitude": null, "artist_location": "", "artist_name": "Line Renaud", "song_id": "SOUPIRU12A6D4FA1E1", "title": "Der Kleine Dompfaff", "duration": 152.92036, "year": 0}`

`
	{
        "num_songs": 1, 
        "artist_id": "ARJIE2Y1187B994AB7", 
        "artist_latitude": null, 
        "artist_longitude": null, 
        "artist_location": "", 
        "artist_name": "Line Renaud", 
        "song_id": "SOUPIRU12A6D4FA1E1", 
        "title": "Der Kleine Dompfaff", 
        "duration": 152.92036, 
        "year": 0
    }
`
From this metadata we are able to identify information about artists and the songs themselves. 

The second data source is a directory of user activity logs organised into folders by year and month, and with each days activity aggregated into one JSON file. Here is the data from an example log file (from 12/11/2018) formatted as a table: 

![Log file example](/assets/log-data.png)

