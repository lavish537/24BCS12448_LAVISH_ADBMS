SELECT u.user_id, u.user_name
FROM users u
JOIN friends f1 ON u.user_id = f1.friend_id
JOIN friends f2 ON u.user_id = f2.friend_id
WHERE f1.user_id = (SELECT user_id FROM users WHERE user_name = 'Karl')
  AND f2.user_id = (SELECT user_id FROM users WHERE user_name = 'Hans');
