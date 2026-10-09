/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s5.1_ia.sql
USER:    ia
PURPOSE: Step 5.1: Create a table directly from the view using SELECT INTO.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_hello_world;
GO

SELECT 
    v.message_id,
    v.message_text
INTO dbo.t_hello_world
FROM dbo.v_hello_world AS v;
GO

-- Verification query
SELECT * FROM dbo.t_hello_world;