SELECT DISTINCT c.email
FROM crm_contacts c
JOIN marketing_touches m1 ON c.contact_id = m1.contact_id
JOIN marketing_touches m2 ON m1.contact_id = m2.contact_id
JOIN marketing_touches m3 ON m1.contact_id = m3.contact_id
JOIN marketing_touches t ON c.contact_id = t.contact_id
WHERE DATE_TRUNC('week', m2.event_date) = DATE_TRUNC('week', m1.event_date) + INTERVAL '1 week'
AND DATE_TRUNC('week', m3.event_date) = DATE_TRUNC('week', m1.event_date) + INTERVAL '2 weeks'
AND t.event_type = 'trial_request';
