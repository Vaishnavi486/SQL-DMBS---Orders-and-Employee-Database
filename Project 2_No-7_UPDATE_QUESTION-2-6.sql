--2. Create the CREATE TABLE scripts which will build the tables as idenƟfied above. Your database name must 
--contain your group name and adhere to the following referenƟal Integrity constraints which must be populated 
--within the create table script, they are as follows: 

-- EmployeeID in DEPENDENTS must exist in EmployeeID in EMPLOYEES
-- EmployeeID in EMPLOYEEPERSONAL must exist in EmployeeID in EMPLOYEES
-- EmployeeID in EMPLOYEECONTACTSS must exist in EmployeeID in EMPLOYEES
-- EmployeeID in EMERGENCYCONTACTS must exist in EmployeeID in EMPLOYEES
-- RoleID in EMPLOYEES must exist in RoleID in ROLES
-- DepartmentID in EMPLOYEES must exist in DepartmentID in DEPARTMENTS
-- ManagerID in EMPLOYEES must exist In EmployeeID in EMPLOYEES but will allow NULL 
-- EmpAddressID in EMPLOYEES must exist in EmpAddressID in EMPLOYEEADDRESS
-- EmployeeID in EMERGENCYCONTACTS must exist in EmployeeID in EMPLOYEES
-- FacilityID in DEPARTMENTS must exist in FacilityID in FACILITYADDRESS
-- FacilityID in ADDRESS must exist in FacilityID in FACILITYADDRESS
-- CountryID in FACILITYADDRESS must exist in CountryID in COUNTRIES
-- CountryID in EMPLOYEEADDRESS must exist in CountryID in COUNTRIES
-- RegionID in COUNTRIES must exist in RegionID in REGIONS

--Autoincrement value: 
-- EmployeeID starts at 1117 and increments by 17 
-- DepartmentID starts at 20 and increments by 20 
-- EmpAddressID starts at 1000 and increments by 2 
-- FacilityID starts at 10 and increments by 1 

--Requirements: 
-- Set the default value for ContactNumber and ContactAltNumber in EMERGENCYCONTACTS to 911 
-- Write a constraint to ensure that CountryName is limited to 6 countries (Canada, Columbia, Brazil, 
--Uganda, Germany, India) 
-- ProbaƟonLength in ROLES is a numeric field represenƟng the number of weeks of probaƟon. 
-- Salary in EMPLOYEES should be an INT data type.



CREATE TABLE REGIONS (
	RegionID INT PRIMARY KEY,
	RegionName VARCHAR(100)
);
--------------------------------------------------------------------------------------
CREATE TABLE COUNTRIES (
	CountryID INT PRIMARY KEY,
	RegionID INT NOT NULL,
	CountryName VARCHAR(100),
	CONSTRAINT FK_Countries_Region 
		FOREIGN KEY (RegionID)REFERENCES REGIONS(RegionID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT chk_countries_countryname 
		CHECK (CountryName IN ('Canada', 'Columbia', 'Brazil', 'Uganda', 'Germany', 'India'))
);
-----------------------------------------------------------------------------------------------
CREATE TABLE FACILITYADDRESS (
	FacilityID INT PRIMARY KEY IDENTITY(10,1),
	CountryID INT NOT NULL,
	FacilityName VARCHAR(100)
);

											GO
											ALTER TABLE FACILITYADDRESS  
											WITH CHECK ADD CONSTRAINT FK_FACILITYADDRESS_COUNTRIES
											FOREIGN KEY (CountryID) REFERENCES COUNTRIES(CountryID) 
											ON UPDATE CASCADE 
											ON DELETE CASCADE
											GO
											ALTER TABLE FACILITYADDRESS CHECK CONSTRAINT FK_FACILITYADDRESS_COUNTRIES
											GO

-----------------------------------------------------------------------------------------------
CREATE TABLE ADDRESS (
	AddressID INT PRIMARY KEY IDENTITY(200,1),
	FacilityID INT NOT NULL,
	StreetNumber VARCHAR(20),
	StreetName VARCHAR(100),
	StreetType VARCHAR(100),
	PostalCode VARCHAR(100),
	City VARCHAR(100),
	Province VARCHAR(100)
	CONSTRAINT Fk_ADDRESS_FACILITYADDRESS 
		FOREIGN KEY (FacilityID)REFERENCES FACILITYADDRESS(FacilityID) ON UPDATE CASCADE ON DELETE CASCADE
);
-----------------------------------------------------------------------------------------------
CREATE TABLE DEPARTMENTS (
	DepartmentID INT PRIMARY KEY IDENTITY(20,20),
	FacilityID INT NOT NULL,
	DepartmentName VARCHAR(100),
	DepartmentDesc VARCHAR(100),
	CONSTRAINT Fk_Departments_Facility 
		FOREIGN KEY (FacilityID) REFERENCES FACILITYADDRESS(FacilityID) ON UPDATE CASCADE ON DELETE CASCADE
);
------------------------------------------------------------------------------------------------
CREATE TABLE EMPLOYEEADDRESS (
	EmpAddressID INT PRIMARY KEY IDENTITY(1000,2),
	CountryID INT NOT NULL,
	HomeType VARCHAR(50),
	UnitNumber VARCHAR(50),
	CONSTRAINT Fk_Employeeaddress_Country 
		FOREIGN KEY (CountryID) REFERENCES COUNTRIES(CountryID) ON UPDATE CASCADE ON DELETE CASCADE
);
------------------------------------------------------------------------------------------------
CREATE TABLE ROLES (
	RoleID INT PRIMARY KEY,
	PositionTitle VARCHAR(100),
	PositionDescription VARCHAR(500),
	ProbationLength INT,
	MinSalary DECIMAL(10, 2),
	MaxSalary DECIMAL(10, 2)
);

------------------------------------------------------------------------------------------------
CREATE TABLE EMPLOYEES (
	EmployeeID INT PRIMARY KEY IDENTITY(1117,17),
	RoleID INT NOT NULL,
	ManagerID INT,
	DepartmentID INT NOT NULL,
	EmpAddressID INT NOT NULL,
	FName VARCHAR(50),
	LName VARCHAR(50),
	Salary DECIMAL(10, 2),
	HireDate DATE,
	PersonaleMail VARCHAR(50),
	PersonalPhoneNumber VARCHAR(20),
	CONSTRAINT Fk_Employees_Role 
		FOREIGN KEY (RoleID) REFERENCES ROLES(RoleID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Fk_Employees_Department 
		FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENTS(DepartmentID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Fk_Employees_Address 
		FOREIGN KEY (EmpAddressID) REFERENCES EMPLOYEEADDRESS(EmpAddressID)  ON DELETE NO ACTION ON UPDATE NO ACTION
		--ON UPDATE CASCADE ON DELETE CASCADE
);

											GO
											ALTER TABLE EMPLOYEES  
											WITH CHECK ADD CONSTRAINT Fk_Employees_Manager 
											FOREIGN KEY (ManagerID) REFERENCES EMPLOYEES(EmployeeID) 
											ON DELETE NO ACTION 
											ON UPDATE NO ACTION
											GO
											ALTER TABLE EMPLOYEES CHECK CONSTRAINT Fk_Employees_Manager
											GO
	
-------------------------------------------------------------------------------------------------------
CREATE TABLE EMPLOYEEPERSONAL (
	PersonalID INT PRIMARY KEY ,
	EmployeeID INT NOT NULL,
	DateOfBirth DATE,
	SocialSecurityNumber VARCHAR(20),
	AllergyName VARCHAR(100),
	AllergyDescription VARCHAR(500),
	EpiPen VARCHAR(100),
	DisabilityName VARCHAR(100),
	DisabilityDesc VARCHAR(500),
	Gender VARCHAR(10),
	CONSTRAINT Fk_Employeepersonal_Employees 
		FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE
);
-------------------------------------------------------------------------------------------------------
CREATE TABLE DEPENDENTS (
	DependentID INT PRIMARY KEY,
	EmployeeID INT NOT NULL,
	Relationships VARCHAR(100),
	FName VARCHAR(100),
	LName VARCHAR(100),
	DateOfBirth DATE,
	CONSTRAINT Fk_Dependents_Employees 
		FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE
);
--------------------------------------------------------------------------------------------------------
CREATE TABLE EMPLOYEECONTACTS (
	EmpContactID INT PRIMARY KEY,
	EmployeeID INT NOT NULL,
	FacilityID INT NOT NULL,
	WorkExtension VARCHAR(10),
	OfficeNumber VARCHAR(20),
	CONSTRAINT Fk_EMPLOYEECONTACTS_Employees 
		FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT Fk_EMPLOYEECONTACTS_Facility 
		FOREIGN KEY (FacilityID) REFERENCES FACILITYADDRESS(FacilityID) ON DELETE NO ACTION ON UPDATE NO ACTION
);
--------------------------------------------------------------------------------------------------------
CREATE TABLE EMERGENCYCONTACTS (
	ContactID INT PRIMARY KEY ,
	EmployeeID INT NOT NULL,
	FName VARCHAR(100),
	LName VARCHAR(100),
	ContactNumber VARCHAR(100) DEFAULT '911',
	ContactAltNumber VARCHAR(100) DEFAULT '911',
	CONSTRAINT Fk_EmergencyContacts_Employees 
		FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE
);

--3. Create a SQL INSERT script that will insert at least 5 records for each table in the database. Ensure that 
--referenƟal integrity has been upheld and that all of your PK-FK fields properly share data.

--SELECT RegionID, RegionName FROM REGIONS;
INSERT INTO REGIONS VALUES (101, 'Northern');
INSERT INTO REGIONS VALUES (102, 'Southern');
INSERT INTO REGIONS VALUES (103, 'Western');
INSERT INTO REGIONS VALUES (104, 'Eastern');
INSERT INTO REGIONS VALUES (105, 'Downtown');
INSERT INTO REGIONS VALUES (106, 'Uptown');

--SELECT CountryID, RegionID, CountryName FROM COUNTRIES;
INSERT INTO COUNTRIES VALUES (1, 101, 'Canada');
INSERT INTO COUNTRIES VALUES (57, 102, 'Columbia');
INSERT INTO COUNTRIES VALUES (55, 103, 'Brazil');
INSERT INTO COUNTRIES VALUES (256, 104, 'Uganda');
INSERT INTO COUNTRIES VALUES (84, 105, 'Germany');
INSERT INTO COUNTRIES VALUES (62, 106, 'India');

--SELECT FacilityID, CountryID, FacilityName FROM FACILITYADDRESS;
INSERT INTO FACILITYADDRESS VALUES (1, 'Ben Mills');
INSERT INTO FACILITYADDRESS VALUES (57, 'Maris Karklins');
INSERT INTO FACILITYADDRESS VALUES (55, 'Ifeoluwa Ogunrinola');
INSERT INTO FACILITYADDRESS VALUES (256, 'Tania Sanghi');
INSERT INTO FACILITYADDRESS VALUES (84, 'Anurag Dhuria');
INSERT INTO FACILITYADDRESS VALUES (62, 'Varun Naroia');

--SELECT AddressID, FacilityID, StreetNumber, StreetName, StreetType, PostalCode, City, Province FROM ADDRESS;
INSERT INTO ADDRESS VALUES (10, '368', 'Hemlock Street', 'Avenue', 'N0B 1N0', 'Waterloo', 'Ontario');
INSERT INTO ADDRESS VALUES (11, '15', 'Wellington Street', 'Bay', '050 001', 'Medellín', 'Antioquia');
INSERT INTO ADDRESS VALUES (12, '180', 'King Street', 'Boulevard', '27949-316', 'Manaus', 'Amazonas');
INSERT INTO ADDRESS VALUES (13, '685', 'Queen Street', 'Circle', '759 125', 'Kampala', 'Central');
INSERT INTO ADDRESS VALUES (14, '638', 'Thomas Street', 'Court', '01234', 'Haiphong', 'Nghệ An');
INSERT INTO ADDRESS VALUES (15, '85', 'Fredrick Street', 'Cove', '99111', 'Jaipur', 'Northern');

--SELECT DepartmentID, FacilityID, DepartmentName, DepartmentDesc FROM DEPARTMENTS;
INSERT INTO DEPARTMENTS VALUES (10, 'DBMS', 'database management system');
INSERT INTO DEPARTMENTS VALUES (11, 'MIS', 'management information system');
INSERT INTO DEPARTMENTS VALUES (12, 'TC', 'techinal communication');
INSERT INTO DEPARTMENTS VALUES (13, 'QA', 'quantative analysis');
INSERT INTO DEPARTMENTS VALUES (14, 'C101', 'conestogac 101');
INSERT INTO DEPARTMENTS VALUES (15, 'BAF', 'bussiness analysis foundation');

--SELECT EmpAddressID, CountryID, HomeType, UnitNumber FROM EMPLOYEEADDRESS;
INSERT INTO EMPLOYEEADDRESS VALUES (1, 'detached', '23');
INSERT INTO EMPLOYEEADDRESS VALUES (57, 'semi-detached', '53');
INSERT INTO EMPLOYEEADDRESS VALUES (55, 'condos', '82' );
INSERT INTO EMPLOYEEADDRESS VALUES (256, 'townhouse', '93');
INSERT INTO EMPLOYEEADDRESS VALUES (84, 'duplexe', '92');
INSERT INTO EMPLOYEEADDRESS VALUES (62, 'bungalow', '12');

--SELECT RoleID, PositionTitle, PositionDescription, ProbationLength, MinSalary, MaxSalary FROM ROLES;
INSERT INTO ROLES VALUES (15, 'HR', 'human resources', 7, 78000, 87000);
INSERT INTO ROLES VALUES (16, 'QA', 'quality analyst', 1, 11000, 22000);
INSERT INTO ROLES VALUES (17, 'SD', 'software developer', 3, 89000, 98000);
INSERT INTO ROLES VALUES (18, 'MNG', 'manager', 8, 39000, 93000);
INSERT INTO ROLES VALUES (19, 'CEO', 'chief executive officer', 9, 57000, 75000);
INSERT INTO ROLES VALUES (20, 'PM', 'project manager', 11, 26000, 62000);

--SELECT EmployeeID, RoleID, ManagerID, DepartmentID, EmpAddressID, FName, LName, Salary, HireDate, PersonaleMail, PersonalPhoneNumber FROM EMPLOYEES;
INSERT INTO EMPLOYEES VALUES (15, NULL, 20, 1000, 'Vaishnavi', 'Wadhwa', 98000, '2001-03-28', 'vw@gmail.com', '6503995861');
INSERT INTO EMPLOYEES VALUES (16, 1117, 40, 1002, '⁠Saurabh', 'Kanojia', 87000, '2005-08-19', 'sk@gmail.com', '9503995861');
INSERT INTO EMPLOYEES VALUES (17, 1134, 60, 1004, '⁠Priyansh', 'Patel', 76000, '2012-11-12', 'pp@gmail.com', '5503995861');
INSERT INTO EMPLOYEES VALUES (18, 1117, 80, 1006, '⁠Brian', 'Mogaria', 65000, '2016-06-12', 'bm@gmail.com', '3503995861');
INSERT INTO EMPLOYEES VALUES (19, 1134, 100, 1008, 'Swayam', 'Ojha', 54000, '2019-07-31', 'so@gmail.com', '1503995861');
INSERT INTO EMPLOYEES VALUES (19, 1134, 100, 1008, 'Damilare', 'Akinwale', 43000, '2023-01-17', 'da@gmail.com', '9503995861');

--SELECT PersonalID, EmployeeID, DateOfBirth, SocialSecurityNumber, AllergyName, AllergyDescription, EpiPen, DisabilityName, DisabilityDesc, Gender FROM EMPLOYEEPERSONAL;
INSERT INTO EMPLOYEEPERSONAL VALUES (8009, 1117, '2001-03-28', '123456789', 'Imitation allergy', 'Allergy from imitated ornaments', 'EpiPen', 'Neurological disability', 'A type of nervous system disorder', 'Female');
INSERT INTO EMPLOYEEPERSONAL VALUES (8018, 1134, '2000-08-19', '023456789', NULL, NULL, 'EpiPen Jr.', 'Special-sense organs disability', 'A sensory disability is a disability of the senses', 'Male');
INSERT INTO EMPLOYEEPERSONAL VALUES (8027, 1151, '2001-11-12', '723456789', 'Pollen allergy', 'Allergy from pollen', 'EpiPen Jr.', 'Musculoskeletal disability', 'Diseases of the connective tissues including bones, muscles', 'Male');
INSERT INTO EMPLOYEEPERSONAL VALUES (8036, 1168, '2000-06-12', '323456789', 'Cosmetics allergy', 'Allergy from Cosmetics', 'EpiPen', 'Respiratory disability', 'Breating problems', 'Male');
INSERT INTO EMPLOYEEPERSONAL VALUES (8045, 1185, '2000-07-31', '223456789', 'Dust allergy', 'Allergy from dust', 'EpiPen Jr.', 'Cardiovascular disability', 'Heart problems', 'Female');
INSERT INTO EMPLOYEEPERSONAL VALUES (8054, 1202, '2001-01-17', '823456789', 'Cephalosporins allergy', 'Medical allergy' , 'EpiPen', 'Digestive disability', 'Irritable bowel syndrome', 'Male');

--SELECT DependentID, EmployeeID, Relationships, FName, LName, DateOfBirth FROM DEPENDENTS;
INSERT INTO DEPENDENTS VALUES (201, 1117, 'Wife', 'Vaishnavi', 'Wadhwa', '2001-03-28');
INSERT INTO DEPENDENTS VALUES (202, 1134, 'Brother', '⁠Saurabh', 'Kanojia', '2000-08-19');
INSERT INTO DEPENDENTS VALUES (203, 1151, 'Uncle', '⁠Priyansh', 'Patel', '2001-11-12');
INSERT INTO DEPENDENTS VALUES (204, 1168, 'Cousin', '⁠Brian', 'Mogaria', '2000-06-12');
INSERT INTO DEPENDENTS VALUES (205, 1185, 'Sister', 'Swayam', 'Ojha', '2000-07-31');
INSERT INTO DEPENDENTS VALUES (206, 1202, 'Husband', 'Damilare', 'Akinwale', '2001-01-17');

--SELECT EmpContactID, EmployeeID, FacilityID, WorkExtension, OfficeNumber FROM EMPLOYEECONTACTS;
INSERT INTO EMPLOYEECONTACTS VALUES (211, 1117, 10, '1627', '165');
INSERT INTO EMPLOYEECONTACTS VALUES (212, 1134, 11, '1212', '161');
INSERT INTO EMPLOYEECONTACTS VALUES (213, 1151, 12, '1928', '169');
INSERT INTO EMPLOYEECONTACTS VALUES (214, 1168, 13, '0308', '101');
INSERT INTO EMPLOYEECONTACTS VALUES (215, 1185, 14, '1196', '107');
INSERT INTO EMPLOYEECONTACTS VALUES (216, 1202, 15, '0612', '171');

--SELECT ContactID, EmployeeID, FName, LName, ContactNumber, ContactAltNumber FROM EMERGENCYCONTACTS;
INSERT INTO EMERGENCYCONTACTS VALUES (07, 1117, 'Vaishnavi', 'Wadhwa', NULL, NULL);
INSERT INTO EMERGENCYCONTACTS VALUES (14, 1134, '⁠Saurabh', 'Kanojia', '9503995861', '2000081908');
INSERT INTO EMERGENCYCONTACTS VALUES (21, 1151, '⁠Priyansh', 'Patel', '5503995861', '2001111207');
INSERT INTO EMERGENCYCONTACTS VALUES (28, 1168, '⁠Brian', 'Mogaria', NULL, NULL);
INSERT INTO EMERGENCYCONTACTS VALUES (35, 1185, 'Swayam', 'Ojha', '1503995861', '2000073105');
INSERT INTO EMERGENCYCONTACTS VALUES (42, 1202, 'Damilare', 'Akinwale',DEFAULT,DEFAULT);


--4) Create a SQL UPDATE script to modify one RoleID in the Roles Table to x000, where x is your group number. Ie.
--Group 5 would put in 5000 as the updated role ID. 

UPDATE ROLES
SET RoleID = 7000
WHERE RoleID = 19;

--SELECT * FROM ROLES;  -- PK 

--5) Create a view that will display each manager with all of their subordinates. You will need to use aliases for table
--names to create a view based on a recursive relaƟonship. Your output must also include any employees who do
--not currently have a supervisor.

GO
CREATE OR ALTER VIEW [Display each manager with all of their subordinates] 
AS
SELECT e.Fname AS Subordinate, m.Fname AS supervisior FROM Employees e
LEFT OUTER JOIN
Employees m
ON
e.ManagerID = m.EmployeeID
WHERE e.Fname IS NOT NULL ;
GO
SELECT * FROM [Display each manager with all of their subordinates];

--SELECT * FROM EMPLOYEES;


--6) Create a view to display all employees who have allergies, but do not have an emergency contact.

GO
CREATE OR ALTER VIEW EmployeesWithAllergiesNoEmergencyContact 
AS
SELECT ep.EmployeeID, e.FName, e.LName, ep.AllergyName, ep.AllergyDescription 
FROM EMPLOYEES e JOIN EMPLOYEEPERSONAL ep 
ON e.EmployeeID = ep.EmployeeID
JOIN EMERGENCYCONTACTS ec
ON e.EmployeeID = ec.EmployeeID
WHERE
ep.AllergyName IS NOT NULL OR  ep.AllergyName <> '' 
AND 
ec.ContactNumber IS NULL 
OR
ISNULL(ec.ContactNumber, '911') = '911' AND ISNULL(ec.ContactAltNumber, '911') = '911'  ;
GO

SELECT * FROM EmployeesWithAllergiesNoEmergencyContact;

--SELECT * FROM EMERGENCYCONTACTS;


