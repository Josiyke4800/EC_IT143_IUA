/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s5.1_ia.sql
USER:    ia
PURPOSE: Step 5.1: Create a table directly from the view using SELECT INTO.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_myfc_players_per_team;
GO

SELECT 
    v.team_id,
    v.total_players
INTO dbo.t_myfc_players_per_team
FROM dbo.v_myfc_players_per_team AS v;
GO

-- Verification query
SELECT * FROM dbo.t_myfc_players_per_team;