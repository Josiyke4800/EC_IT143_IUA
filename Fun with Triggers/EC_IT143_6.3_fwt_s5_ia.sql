-- Step 5: Test results to see if they are as expected
-- 1. View before
SELECT CustomerID, ContactName, City, last_modified_date, last_modified_by
FROM dbo.t_w3_schools_customers 
WHERE CustomerID = 1;

-- 2. Update a field to trigger the update
UPDATE dbo.t_w3_schools_customers
SET City = 'Berlin-Central'
WHERE CustomerID = 1;

-- 3. View after (date and user should now be populated automatically)
SELECT CustomerID, ContactName, City, last_modified_date, last_modified_by
FROM dbo.t_w3_schools_customers 
WHERE CustomerID = 1;