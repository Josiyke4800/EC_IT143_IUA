-- Step 6: Compare UDF results to ad hoc query results
SELECT 
    CustomerID,
    ContactName,
    CASE 
        WHEN CHARINDEX(' ', ContactName) > 0 
        THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
        ELSE ContactName 
    END AS first_name_adhoc,
    dbo.fn_get_first_name(ContactName) AS first_name_udf,
    dbo.fn_get_last_name(ContactName)  AS last_name_udf
FROM dbo.t_w3_schools_customers;