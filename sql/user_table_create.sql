CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY
    , first_name varchar
    , last_name varchar
    , gender varchar(1)
    , user_level varchar CHECK (user_level IN ('free', 'paid'))
);
