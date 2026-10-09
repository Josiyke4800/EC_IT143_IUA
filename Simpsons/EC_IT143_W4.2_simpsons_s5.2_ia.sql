/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_simpsons_s5.2_ia.sql
USER:    ia
PURPOSE: Step 5.2: Refine table architecture with explicit data types, NOT NULL, and Primary Key.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_simpsons_members_per_dept;
GO

CREATE TABLE dbo.t_simpsons_members_per_dept
(
    department    NVARCHAR(50) NOT NULL,
    total_members INT          NOT NULL,
    CONSTRAINT PK_t_simpsons_members_per_dept PRIMARY KEY CLUSTERED (department ASC)
);
GO