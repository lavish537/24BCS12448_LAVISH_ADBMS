SELECT cuisine,
SUM(CASE WHEN category = 'Non veg' THEN price ELSE 0 END) AS Non_Veg_Price
FROM Orders
GROUP BY cuisine;
