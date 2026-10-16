/***************************************************************************************************
NAME:    EC_IT143_W6.4_Performance_Analysis_ia.sql
PURPOSE: Performance Analysis - Execution Plans, Missing Index Recommendations, and Index Creation.
AUTHOR:  Ikechukwu Ajike
***************************************************************************************************/

USE Simpsons;
GO

-- =================================================================================================
-- DEMONSTRATION 1: dbo.Family_Data (Filtering on unindexed Job_Title column)
-- =================================================================================================

-- Step 1, 2, & 3: Run baseline query with "Include Actual Execution Plan" turned on (Ctrl + M)
SELECT f.*
FROM dbo.Family_Data AS f
WHERE f.Job_Title = 'Nuclear Safety Inspector';
GO

-- Step 6 & 7: Create the recommended Nonclustered Index on Job_Title
CREATE NONCLUSTERED INDEX IX_FamilyData_JobTitle
ON dbo.Family_Data (Job_Title);
GO

-- Step 8: Re-run the query to evaluate the execution plan
SELECT f.*
FROM dbo.Family_Data AS f
WHERE f.Job_Title = 'Nuclear Safety Inspector';
GO


-- =================================================================================================
-- DEMONSTRATION 2: dbo.t_w3_schools_customers (Filtering on unindexed City column)
-- =================================================================================================

-- Step 1, 2, & 3: Run baseline query on unindexed City column
SELECT c.*
FROM dbo.t_w3_schools_customers AS c
WHERE c.City = 'London';
GO

-- Step 6 & 7: Create the recommended Nonclustered Index on City
CREATE NONCLUSTERED INDEX IX_Customers_City
ON dbo.t_w3_schools_customers (City);
GO

-- Step 8: Re-run the query to evaluate the execution plan
SELECT c.*
FROM dbo.t_w3_schools_customers AS c
WHERE c.City = 'London';
GO