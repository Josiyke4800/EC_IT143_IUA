-- Step 3: Research and test a solution
-- URL: https://docs.microsoft.com/en-us/sql/t-sql/functions/suser-name-transact-sql
SELECT 
    GETDATE()     AS current_server_datetime,
    SUSER_NAME()  AS current_database_user;