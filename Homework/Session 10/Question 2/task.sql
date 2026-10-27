SELECT cuisine,
COUNT(CASE WHEN category = 'Veg' THEN 1 ELSE NULL END) AS Veg_Dish_Count
FROM Orders
GROUP BY cuisine;
