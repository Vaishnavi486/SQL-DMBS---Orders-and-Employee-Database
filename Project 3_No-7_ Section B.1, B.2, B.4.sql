--Section B: Expanding database functionality 
--You will submit your SQL answers for questions 1,2, and 4 for this section as a .SQL file. Your response for Question 3 will 
--need to be included with the .PDF submission for Section C. 
--1) Create and test a user-defined function named LastNameFirst#, where the # is your group number. It should 
--combine two string parameters named FName and LName into a single concatenated name field formatted as: 
--LName, FName 
--Be sure to include the comma and space. 
--Provide the SQL script as your answer.


--LastNameFirst7

GO
	CREATE OR ALTER FUNCTION dbo.LastNameFirst7 (@userID1 VARCHAR(50),@userID2 VARCHAR(50))
	RETURNS VARCHAR(50) AS 
		BEGIN 
			DECLARE @returnValue VARCHAR(50)
				SELECT @returnValue = (TRIM(@userID1)+ ', ' + TRIM(@userID2)) FROM EMPLOYEES; 
			RETURN @returnValue
		END
GO

	SELECT dbo.LastNameFirst7('Wadhwa','Vaishnavi') AS LastNameFirst7;

--SELECT (TRIM(LName)+ ', ' + TRIM(FName)) AS LastNameFirst7 FROM EMPLOYEES;


--2) Create and test a view called EmployeesMedicalConcerns that contains the name of any employee who has a 
--known allergy, along with their allergy. List a concatenated field aliased as EmpName, containing both Fname 
--and Lname attributes (LName, FName), followed by a second field containing the AllergyName field. Provide the 
--SQL script as your answer. 

GO
	CREATE OR ALTER VIEW EmployeesMedicalConcerns
	AS
		SELECT (TRIM(e.LName) + ', ' + TRIM(e.FName)) AS EmpName, a.AllergyName 
		FROM EMPLOYEES e ,ALLERGIES a, EMPLOYEEPERSONAL ep
		WHERE e.EmployeeID = ep.EmployeeID AND ep.PersonalID = a.PersonalID;
GO

	SELECT * FROM EmployeesMedicalConcerns ORDER BY EmpName, AllergyName;


--3) Part of your responsibilities as a DBA has you routinely cleansing data to ensure proper data formats are being 
--enforced across all tables. This activity, while important, consumes a significant part of your time that could be 
--better spent working on more value-add projects. You want to partially automate the process through the 
--development of stored procedures but would need approval from your boss. Write a brief memo to Matt Kozi, 
--Solutions Architect, explaining the purpose of stored procedures and how you would implement stored 
--procedures to simplify administration of the database. 
--For your example to Mr. Kozi, you will be focusing on the Salary field in the Employee table. 
--Stored Procedure: 
--a. Convert the INT to a CHAR (SQL command) 
--b. Insert commas, decimal places and dollar signs where appropriate in the data for the salary attribute for 
--the Employee entity. 
--To answer this question, you are to provide a written explanation, not the SQL script. 

/* ANSWERED IN PDF */

--4) Provide your employer with the SQL script needed to build the stored procedure listed above. 


GO
CREATE OR ALTER PROCEDURE UpDated_Salary
AS
BEGIN
	ALTER TABLE Employees
	ALTER COLUMN Salary Char(17)
	UPDATE EMPLOYEES
	SET SALARY = '$ ' + FORMAT(CONVERT(MONEY, Salary), 'N')
	PRINT('Salary has been converted to char.');
END;
GO
 
EXEC UpDated_Salary;

--verifying the O/P
	SELECT Salary FROM EMPLOYEES;






















