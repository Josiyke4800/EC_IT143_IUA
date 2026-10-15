-- Step 3: Create an ad hoc SQL query
SELECT 
    CustomerID,
    ContactName,
    CASE 
        WHEN CHARINDEX(' ', ContactName) > 0 
        THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
        ELSE ContactName 
    END AS first_name_adhoc
FROM dbo.t_w3_schools_customers;