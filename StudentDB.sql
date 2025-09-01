-- Create Database (you can change the name if needed)
CREATE DATABASE StudentDB;
GO

USE StudentDB;
GO

-- Create Student Table
CREATE TABLE Student (
    EnrollmentNo INT PRIMARY KEY,
    StudentName NVARCHAR(50) NOT NULL,
    StudentSemester INT NOT NULL,
    StudentSPI DECIMAL(4,2) NOT NULL,
    StudentCPI DECIMAL(4,2) NOT NULL
);
GO

-- Create Stored Procedure for CRUD
CREATE PROCEDURE Student_Crud
    @Event NVARCHAR(10),
    @EnrollmentNo INT = NULL,
    @StudentName NVARCHAR(50) = NULL,
    @StudentSemester INT = NULL,
    @StudentSPI DECIMAL(4,2) = NULL,
    @StudentCPI DECIMAL(4,2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Event = 'SELECT'
    BEGIN
        SELECT * FROM Student ORDER BY EnrollmentNo;
    END

    ELSE IF @Event = 'INSERT'
    BEGIN
        INSERT INTO Student (EnrollmentNo, StudentName, StudentSemester, StudentSPI, StudentCPI)
        VALUES (@EnrollmentNo, @StudentName, @StudentSemester, @StudentSPI, @StudentCPI);
    END

    ELSE IF @Event = 'UPDATE'
    BEGIN
        UPDATE Student
        SET StudentName = @StudentName,
            StudentSemester = @StudentSemester,
            StudentSPI = @StudentSPI,
            StudentCPI = @StudentCPI
        WHERE EnrollmentNo = @EnrollmentNo;
    END

    ELSE IF @Event = 'DELETE'
    BEGIN
        DELETE FROM Student WHERE EnrollmentNo = @EnrollmentNo;
    END
END;
GO

-- Insert Sample Data
INSERT INTO Student VALUES (101, 'Rahul Sharma', 3, 8.10, 7.95);
INSERT INTO Student VALUES (102, 'Priya Mehta', 5, 7.85, 7.60);
INSERT INTO Student VALUES (103, 'Amit Patel', 2, 9.00, 8.50);
INSERT INTO Student VALUES (104, 'Neha Gupta', 4, 8.50, 8.20);
GO

-- Test Stored Procedure
EXEC Student_Crud @Event = 'SELECT';

---
