/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s3_ia.sql
USER:    ia
PURPOSE: Step 3: Create an ad hoc SQL query.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

SELECT 
    p.t_id AS team_id,
    COUNT(p.pl_id) AS total_players
FROM MyFC.dbo.tblPlayerDim AS p
GROUP BY p.t_id;