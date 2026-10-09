/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s3_ia.sql
USER:    ia
PURPOSE: Step 3: Create an ad hoc SQL query.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

SELECT 
    f.Department AS department,
    COUNT(f.Member_ID) AS total_members
FROM Simpsons.dbo.Family_Data AS f
WHERE f.Department IS NOT NULL
GROUP BY f.Department;