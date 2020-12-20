INSERT INTO dim_time (start_time, start_hour, start_day, start_week, start_month, start_year, start_weekday)
VALUES (%s, %s, %s, %s, %s, %s, %s)
ON CONFLICT (start_time)
DO NOTHING;
