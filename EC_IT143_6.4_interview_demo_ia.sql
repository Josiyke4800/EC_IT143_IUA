/***************************************************************************************************
NAME:    EC_IT143_6.4_interview_demo_ia.sql
PURPOSE: SQL Interview Demonstration #5 - Keys, Joins, and Data Integrity.
AUTHOR:  Ikechukwu Ajike
***************************************************************************************************/

-- -------------------------------------------------------------------------------------------------
-- 1. KEYS & DATA INTEGRITY DEMONSTRATION
-- -------------------------------------------------------------------------------------------------

-- Drop demo tables if they already exist
DROP TABLE IF EXISTS dbo.StudentEnrollments;
DROP TABLE IF EXISTS dbo.Students;
GO

-- Primary Key, Unique Constraint, Check Constraint (Entity & Domain Integrity)
CREATE TABLE dbo.Students (
    StudentID   INT IDENTITY(1,1) NOT NULL, -- Surrogate Primary Key
    NationalID  VARCHAR(20) NOT NULL,        -- Candidate Key / Unique Constraint
    FirstName   VARCHAR(50) NOT NULL,
    LastName    VARCHAR(50) NOT NULL,
    Email       VARCHAR(100) NOT NULL,
    Age         INT CHECK (Age >= 18),       -- Domain Integrity Check
    CONSTRAINT PK_Students_StudentID PRIMARY KEY (StudentID),
    CONSTRAINT UQ_Students_NationalID UNIQUE (NationalID),
    CONSTRAINT UQ_Students_Email UNIQUE (Email)
);
GO

-- Foreign Key Constraint (Referential Integrity)
CREATE TABLE dbo.StudentEnrollments (
    EnrollmentID INT IDENTITY(100,1) PRIMARY KEY,
    StudentID    INT NOT NULL,              -- Foreign Key referencing Students
    CourseName   VARCHAR(100) NOT NULL,
    EnrollDate   DATE DEFAULT GETDATE(),
    CONSTRAINT FK_Enrollments_StudentID FOREIGN KEY (StudentID)
        REFERENCES dbo.Students (StudentID)
        ON DELETE CASCADE
);
GO

-- Insert sample records
INSERT INTO dbo.Students (NationalID, FirstName, LastName, Email, Age)
VALUES 
('NAT101', 'John', 'Doe', 'jdoe@byui.edu', 21),
('NAT102', 'Jane', 'Smith', 'jsmith@byui.edu', 24),
('NAT103', 'Ike', 'Ajike', 'iajike@byui.edu', 22);

INSERT INTO dbo.StudentEnrollments (StudentID, CourseName)
VALUES 
(1, 'Database Design - IT 143'),
(2, 'Networking Foundations - IT 115');
GO

-- -------------------------------------------------------------------------------------------------
-- 2. JOINS DEMONSTRATION
-- -------------------------------------------------------------------------------------------------

-- A. INNER JOIN: Returns only matching rows between both tables
SELECT s.StudentID, s.FirstName, s.LastName, e.CourseName
FROM dbo.Students AS s
INNER JOIN dbo.StudentEnrollments AS e
    ON s.StudentID = e.StudentID;

-- B. LEFT JOIN: Returns all students, plus enrollment data if it exists (includes Ike who has no course)
SELECT s.StudentID, s.FirstName, s.LastName, e.CourseName
FROM dbo.Students AS s
LEFT JOIN dbo.StudentEnrollments AS e
    ON s.StudentID = e.StudentID;

-- C. RIGHT JOIN: Returns all enrollments and their matching student
SELECT s.FirstName, s.LastName, e.CourseName
FROM dbo.Students AS s
RIGHT JOIN dbo.StudentEnrollments AS e
    ON s.StudentID = e.StudentID;

-- D. FULL OUTER JOIN: Returns all records from both sides regardless of match
SELECT s.FirstName, e.CourseName
FROM dbo.Students AS s
FULL OUTER JOIN dbo.StudentEnrollments AS e
    ON s.StudentID = e.StudentID;

-- E. CROSS JOIN: Cartesian product of all rows
SELECT s.FirstName, e.CourseName
FROM dbo.Students AS s
CROSS JOIN dbo.StudentEnrollments AS e;
GO