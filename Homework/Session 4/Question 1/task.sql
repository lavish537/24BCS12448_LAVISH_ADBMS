SELECT u.transaction_date, u.user_id, COUNT(u.product_id) AS purchase_count
FROM user_transactions u
JOIN (
    SELECT user_id, MAX(transaction_date) AS latest_date
    FROM user_transactions
    GROUP BY user_id
) l
ON u.user_id = l.user_id
AND u.transaction_date = l.latest_date
GROUP BY u.transaction_date, u.user_id
ORDER BY u.transaction_date;
