/***************************************************************************************************
NAME:    EC_IT143_W5.2_MyFC_ia.sql
PURPOSE: Answer 4 community questions for the MyFC dataset.

MODIFICATION LOG:
Ver      Date        Author           Description
-----    ----------  ---------------  -------------------------------------------------------------
1.0      10/12/2026  Ikechukwu Ajike  Initial creation answering 4 MyFC questions for W5.2.

RUNTIME: 
~ 1s

NOTES:
Target Database: MyFC
Questions sourced from:
- Q1: Ikechukwu Ajike
- Q2: Ikechukwu Ajike
- Q3: Joseph Gabokgethwe
- Q4: Necolle John Dalupan Nabong
***************************************************************************************************/

USE MyFC;
GO

-- =================================================================================================
-- 1. Question: What are the player IDs, full names, and squad numbers for all players?
-- Author: Ikechukwu Ajike
-- =================================================================================================
SELECT 
    p.pl_id,
    p.pl_name,
    p.f_name,
    p.l_name,
    p.pl_num
FROM dbo.tblPlayerDim AS p
ORDER BY p.pl_id ASC;
GO

-- =================================================================================================
-- 2. Question: Which players have an assigned jersey number, and how are they ordered by number?
-- Author: Ikechukwu Ajike
-- =================================================================================================
SELECT 
    p.pl_id,
    p.pl_name,
    p.pl_num
FROM dbo.tblPlayerDim AS p
WHERE p.pl_num IS NOT NULL
ORDER BY p.pl_num ASC;
GO

-- =================================================================================================
-- 3. Question: What is the total count of players associated with each team ID?
-- Author: Joseph Gabokgethwe
-- =================================================================================================
SELECT 
    p.t_id,
    COUNT(p.pl_id) AS Total_Players
FROM dbo.tblPlayerDim AS p
GROUP BY p.t_id
ORDER BY Total_Players DESC;
GO

-- =================================================================================================
-- 4. Question: What are the performance metrics recorded for each player from the player fact table?
-- Author: Necolle John Dalupan Nabong
-- =================================================================================================
SELECT 
    p.pl_id,
    p.pl_name,
    f.*
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblPlayerFact AS f
    ON p.pl_id = f.pl_id
ORDER BY p.pl_id ASC;
GO