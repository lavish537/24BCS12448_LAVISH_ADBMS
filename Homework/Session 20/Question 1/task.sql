SELECT c.Customer_Name,
       i.Item_Name
FROM Customer c
CROSS JOIN Item i;
