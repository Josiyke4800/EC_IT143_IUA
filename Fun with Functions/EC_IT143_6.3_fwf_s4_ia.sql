-- Step 4: Research and test a solution
-- URL: https://docs.microsoft.com/en-us/sql/t-sql/functions/substring-transact-sql
DECLARE @v_test_name VARCHAR(100) = 'Maria Anders';

SELECT 
    @v_test_name AS input_name,
    CASE 
        WHEN CHARINDEX(' ', @v_test_name) > 0 
        THEN SUBSTRING(@v_test_name, 1, CHARINDEX(' ', @v_test_name) - 1)
        ELSE @v_test_name 
    END AS extracted_first_name;