SELECT *
FROM Customer
INNER JOIN Purchase
    ON Customer.Customer_id = Purchase.Customer_id;
