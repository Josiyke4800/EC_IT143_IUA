/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s6_ia.sql
USER:    ia
PURPOSE: Step 6: Load the table from the view using an ad hoc script (TRUNCATE & INSERT).
******************************************************************************************************************/

USE EC_IT143_DA;
GO

TRUNCATE TABLE dbo.t_simpsons_members_per_dept;

INSERT INTO dbo.t_simpsons_members_per_dept (department, total_members)
SELECT 
    v.department,
    v.total_members
FROM dbo.v_simpsons_members_per_dept AS v;

-- Verification query
SELECT * FROM dbo.t_simpsons_members_per_dept;