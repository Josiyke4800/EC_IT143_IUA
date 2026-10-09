/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s5.2_ia.sql
USER:    ia
PURPOSE: Step 5.2: Refine table architecture with explicit data types, NOT NULL, and Primary Key.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_hello_world;
GO

CREATE TABLE dbo.t_hello_world
(
    message_id   INT NOT NULL,
    message_text VARCHAR(50) NOT NULL,
    CONSTRAINT PK_t_hello_world PRIMARY KEY CLUSTERED (message_id ASC)
);
GO