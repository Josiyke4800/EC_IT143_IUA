/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s8_ia.sql
USER:    ia
PURPOSE: Step 8: Call the stored procedure and review the loaded table.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

-- Execute the stored procedure
EXEC dbo.usp_load_myfc_players_per_team;

-- Verify final contents
SELECT 
    t.team_id,
    t.total_players
FROM dbo.t_myfc_players_per_team AS t;