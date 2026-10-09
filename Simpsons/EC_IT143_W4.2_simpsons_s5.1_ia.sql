/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s5.1_ia.sql
USER:    ia
PURPOSE: Step 5.1: Create a table directly from the view using SELECT INTO.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_simpsons_members_per_dept;
GO

SELECT 
    v.department,
    v.total_members
INTO dbo.t_simpsons_members_per_dept
FROM dbo.v_simpsons_members_per_dept AS v;
GO

-- Verification query
SELECT * FROM dbo.t_simpsons_members_per_dept;