/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s6_ia.sql
USER:    ia
PURPOSE: Step 6: Load the table from the view using an ad hoc script (TRUNCATE & INSERT).
******************************************************************************************************************/

USE EC_IT143_DA;
GO

TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world (message_id, message_text)
SELECT 
    v.message_id,
    v.message_text
FROM dbo.v_hello_world AS v;

-- Verification query
SELECT * FROM dbo.t_hello_world;