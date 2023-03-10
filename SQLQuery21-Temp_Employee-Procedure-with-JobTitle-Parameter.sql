USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 13/03/2023 2:26:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Stored procedures
*/

/*
--Create a stored procedure TEST
CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

--Execute the stored procedure TEST
EXEC TEST
*/

--Create a stored procedure Temp_Employee with
--temp table #temp_employee
ALTER PROCEDURE [dbo].[Temp_Employee] 
--Adding the parameter JobTitle
@JobTitle nvarchar(100)
AS
CREATE TABLE #Temp_Employee (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #Temp_Employee
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE JobTitle = @JobTitle
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee

--Execute this procedure to reflect the update