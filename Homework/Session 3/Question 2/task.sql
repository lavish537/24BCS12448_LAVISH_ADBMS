SELECT COUNT(DISTINCT c1.policy_holder_id) AS policy_holder_count
FROM callers c1
JOIN callers c2
ON c1.policy_holder_id = c2.policy_holder_id
AND c2.call_date > c1.call_date
AND c2.call_date <= c1.call_date + INTERVAL '7 days';
