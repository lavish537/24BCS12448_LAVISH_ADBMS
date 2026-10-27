-- 1. Product report
SELECT p.product_name,
       c.category_name,
       cu.customer_name,
       o.order_date
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN orders o
    ON p.product_name = o.product_name
JOIN customers cu
    ON o.customer_id = cu.customer_id;

-- 2. Total spent by customer
SELECT cu.customer_name,
       SUM(p.price * o.quantity) AS total_spent
FROM customers cu
JOIN orders o
    ON cu.customer_id = o.customer_id
JOIN products p
    ON o.product_name = p.product_name
GROUP BY cu.customer_id, cu.customer_name
ORDER BY total_spent DESC;
