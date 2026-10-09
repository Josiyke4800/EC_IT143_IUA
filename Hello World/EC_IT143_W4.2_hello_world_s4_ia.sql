/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s4_ia.sql
USER:    ia
PURPOSE: Step 4: Turn the ad hoc query into a view.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_hello_world;
GO

CREATE VIEW dbo.v_hello_world
AS
/*****************************************************************************************************************
NAME:    dbo.v_hello_world
PURPOSE: Returns the greeting message record.
******************************************************************************************************************/
SELECT 
    1 AS message_id,
    CAST('Hello World' AS VARCHAR(50)) AS message_text;
GO

-- Verification query
SELECT * FROM dbo.v_hello_world;