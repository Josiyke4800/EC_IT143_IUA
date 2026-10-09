/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s4_ia.sql
USER:    ia
PURPOSE: Step 4: Turn the ad hoc query into a view.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_simpsons_members_per_dept;
GO

CREATE VIEW dbo.v_simpsons_members_per_dept
AS
/*****************************************************************************************************************
NAME:    dbo.v_simpsons_members_per_dept
PURPOSE: Returns member counts grouped by department from the Simpsons database.
******************************************************************************************************************/
SELECT 
    f.Department AS department,
    COUNT(f.Member_ID) AS total_members
FROM Simpsons.dbo.Family_Data AS f
WHERE f.Department IS NOT NULL
GROUP BY f.Department;
GO

-- Verification query
SELECT * FROM dbo.v_simpsons_members_per_dept;