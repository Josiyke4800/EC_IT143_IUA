/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s7_ia.sql
USER:    ia
PURPOSE: Step 7: Turn the ad hoc load script into a stored procedure.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP PROCEDURE IF EXISTS dbo.usp_load_hello_world;
GO

CREATE PROCEDURE dbo.usp_load_hello_world
AS
/*****************************************************************************************************************
NAME:    dbo.usp_load_hello_world
PURPOSE: Truncates and reloads dbo.t_hello_world from dbo.v_hello_world.
******************************************************************************************************************/
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.t_hello_world;

    INSERT INTO dbo.t_hello_world (message_id, message_text)
    SELECT 
        v.message_id,
        v.message_text
    FROM dbo.v_hello_world AS v;
END;
GO