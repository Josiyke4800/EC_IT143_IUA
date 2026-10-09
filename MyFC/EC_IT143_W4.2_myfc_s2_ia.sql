/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_myfc_s2_ia.sql
USER:    ia
PURPOSE: Step 2: Begin creating an answer plan.
******************************************************************************************************************/

-- Q: How many players are on each team in the MyFC database?

-- A: Query dbo.tblPlayerDim in the MyFC database, group by Team_ID, 
--    and use COUNT(Player_ID) to calculate total players assigned to each team.