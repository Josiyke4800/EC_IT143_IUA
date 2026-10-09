/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s6_ia.sql
USER:    ia
PURPOSE: Step 6: Load the table from the view using an ad hoc script (TRUNCATE & INSERT).
******************************************************************************************************************/

USE EC_IT143_DA;
GO

TRUNCATE TABLE dbo.t_myfc_players_per_team;

INSERT INTO dbo.t_myfc_players_per_team (team_id, total_players)
SELECT 
    v.team_id,
    v.total_players
FROM dbo.v_myfc_players_per_team AS v;

-- Verification query
SELECT * FROM dbo.t_myfc_players_per_team;