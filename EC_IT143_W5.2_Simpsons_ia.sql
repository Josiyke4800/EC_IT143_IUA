/***************************************************************************************************
NAME:    EC_IT143_W5.2_Simpsons_ia.sql
PURPOSE: Answer 4 community questions for the Simpsons dataset.

MODIFICATION LOG:
Ver      Date        Author           Description
-----    ----------  ---------------  -------------------------------------------------------------
1.0      10/12/2026  Ikechukwu Ajike  Initial creation answering 4 Simpsons questions for W5.2.

RUNTIME: 
~ 1s

NOTES:
Target Database: Simpsons
Questions sourced from:
- Q1: Ikechukwu Ajike
- Q2: Ikechukwu Ajike
- Q3: Joseph Gabokgethwe
- Q4: Necolle John Dalupan Nabong
***************************************************************************************************/

USE Simpsons;
GO

-- =================================================================================================
-- 1. Question: What are the full names and job titles for all family members?
-- Author: Ikechukwu Ajike
-- =================================================================================================
SELECT 
    f.Member_ID,
    f.Name,
    f.Job_Title
FROM dbo.Family_Data AS f
ORDER BY f.Member_ID ASC;
GO

-- =================================================================================================
-- 2. Question: Can you list members broken down by first name, middle name, and last name?
-- Author: Ikechukwu Ajike
-- =================================================================================================
SELECT 
    f.Member_ID,
    f.First_Name,
    f.Middle_Name,
    f.Last_Name
FROM dbo.Family_Data AS f
ORDER BY f.Last_Name, f.First_Name;
GO

-- =================================================================================================
-- 3. Question: How many members are recorded under each job title?
-- Author: Joseph Gabokgethwe
-- =================================================================================================
SELECT 
    f.Job_Title,
    COUNT(f.Member_ID) AS Total_Members
FROM dbo.Family_Data AS f
WHERE f.Job_Title IS NOT NULL
GROUP BY f.Job_Title
ORDER BY Total_Members DESC;
GO

-- =================================================================================================
-- 4. Question: Which family members currently have an assigned job title on record?
-- Author: Necolle John Dalupan Nabong
-- =================================================================================================
SELECT 
    f.Member_ID,
    f.Name,
    f.Job_Title
FROM dbo.Family_Data AS f
WHERE f.Job_Title IS NOT NULL
ORDER BY f.Name ASC;
GO