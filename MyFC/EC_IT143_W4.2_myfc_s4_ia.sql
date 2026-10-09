/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s4_ia.sql
USER:    ia
PURPOSE: Step 4: Turn the ad hoc query into a view.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_myfc_players_per_team;
GO

CREATE VIEW dbo.v_myfc_players_per_team
AS
/*****************************************************************************************************************
NAME:    dbo.v_myfc_players_per_team
PURPOSE: Returns player counts grouped by team from the MyFC database.
******************************************************************************************************************/
SELECT 
    p.t_id AS team_id,
    COUNT(p.pl_id) AS total_players
FROM MyFC.dbo.tblPlayerDim AS p
GROUP BY p.t_id;
GO

-- Verification query
SELECT * FROM dbo.v_myfc_players_per_team;