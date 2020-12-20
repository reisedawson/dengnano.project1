INSERT INTO users (user_id, first_name, last_name, gender, user_level)
VALUES (%s, %s, %s, %s, %s)
ON CONFLICT (user_id)
DO NOTHING;
