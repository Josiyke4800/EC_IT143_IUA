/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s8_ia.sql
USER:    ia
PURPOSE: Step 8: Call the stored procedure and review the loaded table.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

-- Execute the stored procedure
EXEC dbo.usp_load_hello_world;

-- Verify final contents
SELECT 
    t.message_id,
    t.message_text
FROM dbo.t_hello_world AS t;