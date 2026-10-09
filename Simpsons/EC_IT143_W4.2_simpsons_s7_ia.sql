/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s7_ia.sql
USER:    ia
PURPOSE: Step 7: Turn the ad hoc load script into a stored procedure.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP PROCEDURE IF EXISTS dbo.usp_load_simpsons_members_per_dept;
GO

CREATE PROCEDURE dbo.usp_load_simpsons_members_per_dept
AS
/*****************************************************************************************************************
NAME:    dbo.usp_load_simpsons_members_per_dept
PURPOSE: Truncates and reloads dbo.t_simpsons_members_per_dept from dbo.v_simpsons_members_per_dept.
******************************************************************************************************************/
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.t_simpsons_members_per_dept;

    INSERT INTO dbo.t_simpsons_members_per_dept (department, total_members)
    SELECT 
        v.department,
        v.total_members
    FROM dbo.v_simpsons_members_per_dept AS v;
END;
GO