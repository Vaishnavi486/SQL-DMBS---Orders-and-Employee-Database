--Section A: Repairs, Administration and Concerns 
--Your supervisor has sent you a series of emails with remedies required for the databases functionality, you are to build 
--out the SQL to address the concerns that have been raised, you do not need to create a formal write-up to your 
--supervisor for this section, just the SQL as a .SQL file. 
--1) Address issues with the EmployeePersonal table 
--From: Matt Kozi 
--To: You 
--Subject: Employee allergy table issues, fix? 
--Hi, we’ve been receiving lots of complaints from HR lately regarding failed insurance submissions that the employees are 
--suffering from. Apparently there is some sort of screw-up with processing insurance claims for medication as our system 
--isn’t allowing employees to list out all of their known allergies/conditions and our insurer is rejecting their medical claims 
--as these were not “known conditions”. We did some investigative work and it seems like the problem is originating on 
--your end. After going through the database documentation I noted a design error with the EmployeePersonal table, it 
--only allows employees to list out a single allergy as ‘AllergyName’. The problem is that employees can have lots of 
--allergies, we don’t know how many allergies that an employee can have, most have none, but some of the employees 
--have tons of allergies. Can you do something to allow employees to list out as many allergies as they need? We can’t 
--restrict this, it has to be open-ended, we never know what conditions our employees may have. I get that you may need 
--to update the table designs, but if you could have this done within the next two weeks it would be great, else HR is going 
--to start sending all the angry employees your way. Forward me the SQL afterwards so I can review it, thanks. 
--P.S. I’ve attached a few of the complaints below: 
-- “Company Insurance refuses to cover my medication costs because my allergy isn’t recorded in the employee 
--system. I tried to add my allergies/medication information but it just deletes my existing data. I need to be able 
--to record multiple allergies and descriptions.” 
-- “Every time I update my allergy information with HR, my previous listed allergy gets deleted or dropped or 
--something, can we please do something about this?” 
-- “I have more than ten allergies, how am I supposed to fit that in one input field? Was any thought put into this 
--system at all?” 
-- “I tried listing out all of my allergies separated by commas in the AllergyName field, and now I can’t file any 
--insurance claims, I’m paying out of pocket for meds right now, this is ridiculous.” 
--Matt Kozi 
--Solutions Architect, CBR 
--mKozi@cbr.org

-- create BRAND new ALLERGIES table

CREATE TABLE ALLERGIES (
	PersonalID INT NOT NULL,
	AllergyName VARCHAR(100),
	AllergyDescription VARCHAR(500),
	CONSTRAINT Fk_Employeepersonal_Allergies 
		FOREIGN KEY (PersonalID) REFERENCES EMPLOYEEPERSONAL(PersonalID) ON UPDATE CASCADE ON DELETE CASCADE
);

---- inserting selective values in ALLERGIES table
INSERT INTO ALLERGIES (PersonalID, AllergyName, AllergyDescription)
	SELECT PersonalID, AllergyName, AllergyDescription FROM EMPLOYEEPERSONAL;
GO

-- inserting BRAND new values in ALLERGIES table
INSERT INTO ALLERGIES (PersonalID, AllergyName, AllergyDescription)
VALUES 
	(8027,  'Fish allergy', 'Allergy from fish'),
	(8027,  'Balsam of Peru', 'Redness, swelling, Itching and blisters due to this'),
	(8054,  'Peanut allergy','Anaphylaxis and swelling, sometimes vomiting'),
	(8054,  'Rice allergy','Sneezing, runny nose, itching, stomachache, eczema.'),
	(8054,  'Tetracycline allergy','Many, including: severe headache, dizziness, blurred vision, fever, chills, body aches'),
	(8054,  'Dog allergy','Rash, sneezing, congestion, wheezing, vomiting from coughing, Sometimes itchy welts');
GO

-- CHECK: [TESTING]
SELECT * FROM ALLERGIES ORDER BY PersonalID, AllergyName, AllergyDescription;
SELECT * FROM EMPLOYEEPERSONAL;

--drop columns name AllergyName, AllergyDescription
	ALTER TABLE EMPLOYEEPERSONAL
	DROP COLUMN AllergyName, AllergyDescription;

-- CHECK: [FINAL TESTING]
SELECT (TRIM(e.FName)+ ' ' + TRIM(e.LName)) AS FullName, a.AllergyName, a.AllergyDescription FROM ALLERGIES a 
JOIN EMPLOYEEPERSONAL ep ON a.PersonalID = ep.PersonalID
JOIN EMPLOYEES e ON ep.EmployeeID = e.EmployeeID
ORDER BY FullName, AllergyName, AllergyDescription;


--2) Expanding database usability 
--From: Matt Kozi 
--To: You 
--Subject: Expanding database usability 
--Hi, this is similar to the last email, but several employees have complained that they have multiple addresses but cannot 
--record them all in the system given the current design, adjust to afford employees the ability to have multiple addresses. 
--I don’t think we can really modify the structure of the existing tables to fix this… let’s add an intersection table between 
--to resolve this. Forward me the SQL afterwards so I can review it, thanks. 
--Matt Kozi 
--Solutions Architect, CBR 
--mKozi@cbr.org

--create new intersection from Employees and Address tables

CREATE TABLE MULTIPLEADDRESS
(
		EmployeeID INT NOT NULL, 
		AddressID INT NOT NULL,
		CONSTRAINT Fk_MultipleAddress_Employees 
		FOREIGN KEY (EmployeeID) REFERENCES dbo.EMPLOYEES(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT Fk_MultipleAddress_Address
		FOREIGN KEY (AddressID)REFERENCES dbo.ADDRESS(AddressID) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- inserting old values with the help of join
INSERT INTO MULTIPLEADDRESS (EmployeeID, AddressID)  
	SELECT e.EmployeeID, a.AddressID 
	FROM EMPLOYEES e 
		JOIN EMPLOYEEADDRESS ea 
			ON e.EmpAddressID = ea.EmpAddressID
				JOIN EMPLOYEECONTACTS ec
					ON e.EmployeeID = ec.EmployeeID
						JOIN ADDRESS a
							ON a.FacilityID = ec.FacilityID;

--inserting BRAND new values 
INSERT INTO MULTIPLEADDRESS (EmployeeID, AddressID)
VALUES	(1134,205),
		(1134,200),
		(1168,201),
		(1117,205);

--checking all the inserted values
GO
	CREATE OR ALTER VIEW [A2_mULTIPLE_aDDRESS] 
	AS
	SELECT (TRIM(e.FName) + ' ' + TRIM(e.LName)) AS EmployeeName, TRIM(CONVERT(varchar(10), StreetNumber)  + ' ' + TRIM (a.StreetName) + ' ' +  TRIM (a.StreetType) + ' ' +  TRIM (a.City) + ' ' +  TRIM (a.Province) + ' ' +  TRIM (a.PostalCode)) AS CompleteAddress
	FROM 
	MULTIPLEADDRESS ma
	JOIN 
	ADDRESS a 
	ON ma.AddressID=a.AddressID
	JOIN
	EMPLOYEES e
	ON ma.EmployeeID=e.EmployeeID
GO

SELECT * FROM [A2_mULTIPLE_aDDRESS]
ORDER BY EmployeeName, CompleteAddress;




--3) Database stability concerns 
--From: Matt Kozi 
--To: You 
--Subject: Database stability concerns 
--Okay, I know I keep emailing, but we keep coming across issues with the Employee Database. After reviewing how we’re 
--using the data, we realized that we have been using a relationship between the PK fields of EmployeeAddress entity and 
--Address entity? 
--This has been causing some issues, so I was hoping you could resolve this by enforcing the referential integrity between 
--these tables. To do that you’ll have to change it from a PK-PK relationship to a PK-FK relationship. This shouldn’t be a big 
--fix, just make sure we aren’t drastically changing the structure of the database. Make sure we don’t lose any of our data. 
--As always, send me the SQL commands you built to fix this, thanks. 
--Matt Kozi 
--Solutions Architect, CBR 
--mKozi@cbr.org


-- ADDING NEW COLUMN NAMED EmpAddressID TO ADDRESS TABLE FROM EMPLOYEEADDRESS
											ALTER TABLE ADDRESS 
											ADD EmpAddressID INT;

-- ADDING FK TO ADDRESS TABLE BY EMPLOYEEADDRESS
											ALTER TABLE ADDRESS 
											WITH CHECK ADD CONSTRAINT Fk_EmployeeAddress_Address 
											FOREIGN KEY (EmpAddressID) 
											REFERENCES EMPLOYEEADDRESS (EmpAddressID)
											ON UPDATE NO ACTION 
											ON DELETE NO ACTION 

-- CHECKING EXISTENCE EOF FK
											GO
											ALTER TABLE ADDRESS CHECK CONSTRAINT Fk_EmployeeAddress_Address
											GO

--Insert MATCHING record in EmpAddressID by UPDATE
UPDATE ADDRESS
SET EmpAddressID = 1000 
	WHERE FacilityID=10

UPDATE ADDRESS
SET EmpAddressID = 1002 
	WHERE FacilityID=11

UPDATE ADDRESS
SET EmpAddressID = 1004 
	WHERE FacilityID=12

UPDATE ADDRESS
SET EmpAddressID = 1006 
	WHERE FacilityID=13

UPDATE ADDRESS
SET EmpAddressID = 1008 
	WHERE FacilityID=14

UPDATE ADDRESS
SET EmpAddressID = 1010 
	WHERE FacilityID=15
		

--checking inserted values 
SELECT * FROM ADDRESS; 























