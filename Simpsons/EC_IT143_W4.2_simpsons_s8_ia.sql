/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s8_ia.sql
USER:    ia
PURPOSE: Step 8: Call the stored procedure and review the loaded table.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

-- Execute the stored procedure
EXEC dbo.usp_load_simpsons_members_per_dept;

-- Verify final contents
SELECT 
    t.department,
    t.total_members
FROM dbo.t_simpsons_members_per_dept AS t;