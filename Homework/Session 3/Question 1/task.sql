SELECT age_bucket,
ROUND(100.0 * SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END)
/ SUM(time_spent), 2) AS send_perc,
ROUND(100.0 * SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END)
/ SUM(time_spent), 2) AS open_perc
FROM activities a
JOIN age_breakdown b
ON a.user_id = b.user_id
WHERE activity_type = 'send' OR activity_type = 'open'
GROUP BY age_bucket;
