/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s2_ia.sql
USER:    ia
PURPOSE: Step 2: Begin creating an answer plan.
******************************************************************************************************************/

-- Q: How many members are in each department in the Simpsons database?

-- A: Query dbo.Family_Data in the Simpsons database, filter out null departments if needed, 
--    group by Department, and use COUNT(Member_ID) to calculate total headcount per department.