/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s7_ia.sql
USER:    ia
PURPOSE: Step 7: Turn the ad hoc load script into a stored procedure.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP PROCEDURE IF EXISTS dbo.usp_load_myfc_players_per_team;
GO

CREATE PROCEDURE dbo.usp_load_myfc_players_per_team
AS
/*****************************************************************************************************************
NAME:    dbo.usp_load_myfc_players_per_team
PURPOSE: Truncates and reloads dbo.t_myfc_players_per_team from dbo.v_myfc_players_per_team.
******************************************************************************************************************/
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.t_myfc_players_per_team;

    INSERT INTO dbo.t_myfc_players_per_team (team_id, total_players)
    SELECT 
        v.team_id,
        v.total_players
    FROM dbo.v_myfc_players_per_team AS v;
END;
GO