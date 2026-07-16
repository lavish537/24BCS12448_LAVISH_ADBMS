SELECT product_id, product_name
FROM inventory_current_stock
WHERE product_id NOT IN (
    SELECT DISTINCT product_id
    FROM sales_transactions
);
