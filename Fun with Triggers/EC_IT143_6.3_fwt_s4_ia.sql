-- Step 4: Create an after-update trigger
CREATE OR ALTER TRIGGER dbo.trg_customers_after_update
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT (UPDATE(last_modified_date) OR UPDATE(last_modified_by))
    BEGIN
        UPDATE t
        SET 
            last_modified_date = GETDATE(),
            last_modified_by   = SUSER_NAME()
        FROM dbo.t_w3_schools_customers AS t
        INNER JOIN inserted AS i
            ON t.CustomerID = i.CustomerID;
    END
END;
GO