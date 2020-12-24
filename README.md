# Data Engineering Nanodegree - Project 1
## Data Modelling with Postgres

### Introduction

This is the first project issued as part of Udacity's Data Engineering Nanodegree program.

Sparkify is a startup that provides a music streaming app. They want to analyse the data that they have so far been collecting. By analysing their data they will be able to identify simple things such as most commonly played songs and most active users. With extensions to their data collection and storage ability they could use data analytics to model retention, recurring revenue and even forecast things such as whether, and when, a free user is likely to convert to paid. 

### Data Sources

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

From this metadata we are able to identify information about artists and the songs themselves. 

The second data source is a directory of user activity logs organised into folders by year and month, and with each days activity aggregated into one JSON file. Here is the data from an example log file (from 12/11/2018) formatted as a table: 

![Log file example](/assets/log-data.png)


### Schema Design

To optimise this data for analytical queries we are modelling as a star schema. The following tables were created:

Fact table: 
- songplays

Dimension tables:
- songs
- artists
- users
- dim_time (renamed from time to avoid keyword conflict/confusion)

Structuring the data in this way allows easy, fast aggregation queries over the songplays table to analyse activity but also allows simple and fast joins to the dimensions where necessary. De-normalising the artists and songs into dimenison tables allows easier and faster updates if they become necessary at some point in the future. 

A high level ERD is demonstrated below (generated using DbVisualizer)

![sparkifydb ERD](/assets/erd.png)

There are several constraints applied to the database that may be worth highlighting:

**artists table**
- `artist_id`: This field has been defined as the primary key for this table, automatically bringing with it the UNIQUE and NOT NULL constraints. We do not want to end up with duplicate artists in this table.
- `artist_name`: This field has the NOT NULL constraint on it. Incoming songs metadata should provide us with this as a minimum and so constraining the data in this way will highlight potential issues with our source data before they get to the database.
- If/when the ETL process tries to add a duplicate artist to this table (based on artist_id) it will do nothing and just move on. 


**songs table**
- `song_id`: This field has been defined as the primary key for this table, automatically bringing with it the UNIQUE and NOT NULL constraints. We do not want to end up with duplicate songs in this table.
- `title`: This field has the NOT NULL constraint on it. Incoming songs metadata should provide us with this as a minimum and so constraining the data in this way will highlight potential issues with our source data before they get to the database.
- `artist_id`: This field has the NOT NULL constraint on it. Incoming songs metadata should provide us with this as a minimum and so constraining the data in this way will highlight potential issues with our source data before they get to the database. It could be worth investgating removing this field from the songplays fact table in the future and creating a snowflake schema with the artists table mentioned already referenced by this table instead of the songplays table.
- If/when the ETL process tries to add a duplicate song to this table (based on song_id) it will do nothing and just move on. 


**users table**
- `user_id`: This field has been defined as the primary key for this table, automatically bringing with it the UNIQUE and NOT NULL constraints. We do not want to end up with duplicate users in this table.
- `user_level`: This field has a CHECK constraint on it. This constraint ensures that users have a `user_level` of 'free' or 'paid'. Enforcing consistency like this can help to identify issues with source data in future.
- If/when the ETL process tries to add a duplicate song to this table (based on song_id) it will do nothing and just move on. 


**dim_time table**
- `start_time`: This field has been defined as the primary key for this table, automatically bringing with it the UNIQUE and NOT NULL constraints. We do not want to end up with duplicate times in this table.
- All other fields have the NOT NULL constraint. These fields are generated by the ETL process based on the `start_time` field and therefore highlighting where NULLs occur could identify issues with our ETL process.
- If/when the ETL process tries to add a duplicate song to this table (based on song_id) it will do nothing and just move on. 


**songplays table**
- `songplay_id`: This field has been defined as the primary key for this table, automatically bringing with it the UNIQUE and NOT NULL constraints. We do not want to end up with duplicate times in this table. It is also defined with the `SERIAL` keyword - this means that we can allow the insertion process to auto-generate an auto-incrementing ingetger key value to input here. This is useful as we don't have anything immediately available to use within the logs data.
- `start_time`, `user_id`, `song_id` and `artist_id` all REFERENCE their respective dimension tables as FOREIGN KEY constraints. This is so that we can ensure referential integrity. I have applied the NOT NULL constraint to the `user_id` and `start_time` fields as they will be coming from the same source files. I would apply the same constraint to the other two foreign keys but with only this small sample of data we don't have the extensive song and artist lists we would have in production and so for the purposes of testing the ETL process I have removed these constraints and therefore the artist and song id columns will allow NULLs. 


### Example Query

As we have only loaded a sample of the data so far we are unable to generate many matches of song/artist names back to the songplay events. The only ones available so far are as follows:

| Year 	| Month 	| Day 	| User Info             	| Artist 	| Song Name      	|
|------	|-------	|-----	|-----------------------	|--------	|----------------	|
| 2018 	| 11    	| 21  	| paid user - Lily Koch 	| Elena  	| Setanta matins 	|

This was generated using the following SQL SELECT query:

    SELECT 
        start_year AS "Year"
        , start_month AS "Month"
        , start_day AS "Day"
        , u.user_level || ' user - ' || first_name || ' ' || last_name AS "User Info"
        , artist_name AS "Artist"
        , title AS "Song Name"
    FROM songplays AS sp
    JOIN songs AS s ON sp.song_id = s.song_id
    JOIN artists AS ar ON sp.artist_id = ar.artist_id
    JOIN users AS u ON sp.user_id = u.user_id
    JOIN dim_time AS dt ON sp.start_time = dt.start_time
    WHERE title IS NOT NULL OR artist_name IS NOT NULL




TODO:
- Format the table names in the constraints section
- Insert data using COPY FROM

