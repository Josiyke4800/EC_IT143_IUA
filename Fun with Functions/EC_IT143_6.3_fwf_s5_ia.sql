-- Step 5: Create user-defined scalar functions
CREATE OR ALTER FUNCTION dbo.fn_get_first_name (@full_name VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @first_name VARCHAR(100);
    SET @full_name = LTRIM(RTRIM(@full_name));

    IF CHARINDEX(' ', @full_name) > 0
        SET @first_name = SUBSTRING(@full_name, 1, CHARINDEX(' ', @full_name) - 1);
    ELSE
        SET @first_name = @full_name;

    RETURN @first_name;
END;
GO

CREATE OR ALTER FUNCTION dbo.fn_get_last_name (@full_name VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @last_name VARCHAR(100);
    SET @full_name = LTRIM(RTRIM(@full_name));

    IF CHARINDEX(' ', @full_name) > 0
        SET @last_name = SUBSTRING(@full_name, CHARINDEX(' ', @full_name) + 1, LEN(@full_name));
    ELSE
        SET @last_name = @full_name;

    RETURN @last_name;
END;
GO