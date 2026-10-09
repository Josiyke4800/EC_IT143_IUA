/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s5.2_ia.sql
USER:    ia
PURPOSE: Step 5.2: Refine table architecture with explicit data types, NOT NULL, and Primary Key.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_myfc_players_per_team;
GO

CREATE TABLE dbo.t_myfc_players_per_team
(
    team_id       INT NOT NULL,
    total_players INT NOT NULL,
    CONSTRAINT PK_t_myfc_players_per_team PRIMARY KEY CLUSTERED (team_id ASC)
);
GO