-- Step 7: Perform a "0 results expected" test
WITH VerificationCTE AS (
    SELECT 
        CustomerID,
        ContactName,
        CASE 
            WHEN CHARINDEX(' ', ContactName) > 0 
            THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
            ELSE ContactName 
        END AS first_name_adhoc,
        dbo.fn_get_first_name(ContactName) AS first_name_udf
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM VerificationCTE
WHERE first_name_adhoc <> first_name_udf;