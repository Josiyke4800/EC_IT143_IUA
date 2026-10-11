/***************************************************************************************************
NAME:    EC_IT143_W3.4_IA.sql
PURPOSE: Answer 8 AdventureWorks business and metadata questions across 4 complexity tiers.

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   ---------------  -------------------------------------------------------------
1.0     10/11/2026   Ikechukwu Ajike  Initial creation answering 8 student questions for W3.4.

RUNTIME:
~ 2s

NOTES:
Target Database: AdventureWorks2022 (or AdventureWorks2019)
Question Sources:
- Q1: Joseph Gabokgethwe (Marginal)
- Q2: Necolle John Dalupan Nabong (Marginal)
- Q3: Joseph Gabokgethwe (Moderate)
- Q4: Necolle John Dalupan Nabong (Moderate)
- Q5: Ikechukwu Ajike (Increased)
- Q6: Joseph Gabokgethwe (Increased)
- Q7: Ikechukwu Ajike (Metadata)
- Q8: Necolle John Dalupan Nabong (Metadata)
***************************************************************************************************/

USE AdventureWorks2022; -- Change to AdventureWorks2019 if your local database uses that year
GO

-- =================================================================================================
-- 1. Business User question: Marginal complexity
-- Author: Joseph Gabokgethwe
-- Question: Which ten products have the highest list prices?
-- =================================================================================================
SELECT TOP 10
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    p.ListPrice
FROM Production.Product AS p
ORDER BY p.ListPrice DESC;
GO


-- =================================================================================================
-- 2. Business User question: Marginal complexity
-- Author: Necolle John Dalupan Nabong
-- Question: Which five products have the lowest standard cost? (excluding zero cost items)
-- =================================================================================================
SELECT TOP 5
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    p.StandardCost
FROM Production.Product AS p
WHERE p.StandardCost > 0
ORDER BY p.StandardCost ASC;
GO


-- =================================================================================================
-- 3. Business User question: Moderate complexity
-- Author: Joseph Gabokgethwe
-- Question: Which three product subcategories generated the highest total sales revenue from their 
--           associated products?
-- =================================================================================================
SELECT TOP 3
    ps.Name AS SubcategoryName,
    CAST(SUM(sod.LineTotal) AS DECIMAL(18, 2)) AS TotalRevenue
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name
ORDER BY TotalRevenue DESC;
GO


-- =================================================================================================
-- 4. Business User question: Moderate complexity
-- Author: Necolle John Dalupan Nabong
-- Question: Which products belong to each product category, and what is the list price of each product?
-- =================================================================================================
SELECT TOP 50
    pc.Name AS CategoryName,
    ps.Name AS SubcategoryName,
    p.Name AS ProductName,
    p.ListPrice
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
ORDER BY pc.Name, ps.Name, p.Name;
GO


-- =================================================================================================
-- 5. Business User question: Increased complexity
-- Author: Ikechukwu Ajike
-- Question: Which product models experienced the highest total scrapped inventory quantities across 
--           all work orders? Please provide the model name, total scrapped units, and primary scrap reason.
-- =================================================================================================
SELECT TOP 10
    pm.Name AS ProductModelName,
    sr.Name AS ScrapReason,
    SUM(wo.ScrappedQty) AS TotalScrappedQty
FROM Production.WorkOrder AS wo
INNER JOIN Production.Product AS p
    ON wo.ProductID = p.ProductID
INNER JOIN Production.ProductModel AS pm
    ON p.ProductModelID = pm.ProductModelID
INNER JOIN Production.ScrapReason AS sr
    ON wo.ScrapReasonID = sr.ScrapReasonID
WHERE wo.ScrappedQty > 0
GROUP BY pm.Name, sr.Name
ORDER BY TotalScrappedQty DESC;
GO


-- =================================================================================================
-- 6. Business User question: Increased complexity
-- Author: Joseph Gabokgethwe
-- Question: Management wants to understand our bicycle sales performance during 2013. Which bicycle 
--           products generated the most revenue by month, and how many units of each product were sold?
-- =================================================================================================
SELECT
    DATEPART(YEAR, soh.OrderDate) AS OrderYear,
    DATEPART(MONTH, soh.OrderDate) AS OrderMonth,
    p.Name AS BicycleName,
    SUM(sod.OrderQty) AS TotalUnitsSold,
    CAST(SUM(sod.LineTotal) AS DECIMAL(18, 2)) AS MonthlyRevenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes'
  AND soh.OrderDate >= '2013-01-01'
  AND soh.OrderDate < '2014-01-01'
GROUP BY DATEPART(YEAR, soh.OrderDate), DATEPART(MONTH, soh.OrderDate), p.Name
ORDER BY OrderMonth, MonthlyRevenue DESC;
GO


-- =================================================================================================
-- 7. Metadata question
-- Author: Ikechukwu Ajike
-- Question: Which database tables inside AdventureWorks contain a column named BusinessEntityID 
--           according to the columns information schema view?
-- =================================================================================================
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'BusinessEntityID'
ORDER BY TABLE_SCHEMA, TABLE_NAME;
GO


-- =================================================================================================
-- 8. Metadata question
-- Author: Necolle John Dalupan Nabong
-- Question: Can you list the columns, data types, and maximum lengths for all columns in the 
--           Production.Product table?
-- =================================================================================================
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
  AND TABLE_NAME = 'Product'
ORDER BY ORDINAL_POSITION;
GO