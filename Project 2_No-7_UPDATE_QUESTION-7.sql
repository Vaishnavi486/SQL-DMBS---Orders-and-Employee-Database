--7) Write a separate SQL script that will delete all test data from the database. So that the database is ready to be
--used by the client.


TRUNCATE TABLE EMERGENCYCONTACTS
TRUNCATE TABLE EMPLOYEECONTACTS
TRUNCATE TABLE DEPENDENTS
TRUNCATE TABLE EMPLOYEEPERSONAL
TRUNCATE TABLE EMPLOYEES  
TRUNCATE TABLE ROLES
TRUNCATE TABLE EMPLOYEEADDRESS       
TRUNCATE TABLE DEPARTMENTS           
TRUNCATE TABLE ADDRESS
TRUNCATE TABLE FACILITYADDRESS       
TRUNCATE TABLE COUNTRIES
TRUNCATE TABLE REGIONS


-------------------------- Logic used -------------------------------------------------

--TRUNCATE TABLE EMERGENCYCONTACTS

		
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE EMERGENCYCONTACTS 
--											DROP CONSTRAINT Fk_EmergencyContacts_Employees;
--											-- ADDING FK AFTER TRUNCATING 
--											ALTER TABLE EMERGENCYCONTACTS  
--											WITH CHECK ADD CONSTRAINT Fk_EmergencyContacts_Employees 
--											FOREIGN KEY (EmployeeID) 
--											REFERENCES EMPLOYEES(EmployeeID)
--											ON UPDATE CASCADE 
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE EMERGENCYCONTACTS CHECK CONSTRAINT Fk_EmergencyContacts_Employees
--											GO
											

--TRUNCATE TABLE EMPLOYEECONTACTS
											
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE EMPLOYEECONTACTS
--											DROP  CONSTRAINT  Fk_EMPLOYEECONTACTS_Employees,
--												  CONSTRAINT Fk_EMPLOYEECONTACTS_Facility;

--											-- ADDING FK AFTER TRUNCATING 
--											--1
--											GO
--											ALTER TABLE EMPLOYEECONTACTS  
--											WITH CHECK ADD CONSTRAINT Fk_EMPLOYEECONTACTS_Employees 
--											FOREIGN KEY (EmployeeID) 
--											REFERENCES EMPLOYEES(EmployeeID) 
--											ON UPDATE CASCADE 
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE EMPLOYEECONTACTS CHECK CONSTRAINT Fk_EMPLOYEECONTACTS_Employees
--											GO
--											--2
--											GO
--											ALTER TABLE EMPLOYEECONTACTS  
--											WITH CHECK ADD CONSTRAINT Fk_EMPLOYEECONTACTS_Facility 
--											FOREIGN KEY (FacilityID) 
--											REFERENCES FACILITYADDRESS(FacilityID) 
--											ON DELETE NO ACTION 
--											ON UPDATE NO ACTION
--											GO
--											ALTER TABLE EMPLOYEECONTACTS CHECK CONSTRAINT Fk_EMPLOYEECONTACTS_Facility
--											GO
											
--TRUNCATE TABLE DEPENDENTS
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE DEPENDENTS 
--											DROP CONSTRAINT Fk_Dependents_Employees;
--											-- ADDING FK AFTER TRUNCATING 
--											GO
--											ALTER TABLE DEPENDENTS  
--											WITH CHECK ADD CONSTRAINT Fk_Dependents_Employees 
--											FOREIGN KEY (EmployeeID) 
--											REFERENCES EMPLOYEES(EmployeeID) 
--											ON DELETE NO ACTION 
--											ON UPDATE NO ACTION
--											GO
--											ALTER TABLE DEPENDENTS CHECK CONSTRAINT Fk_Dependents_Employees
--											GO
											
--TRUNCATE TABLE EMPLOYEES
--			-- REFERED BY EMPLOYEES[SELF LOOP], EMPLOYEEPERSONAL, DEPENDENTS, EMPLOYEECONTACTS, EMERGENCYCONTACTS
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE EMPLOYEES 
--											DROP  CONSTRAINT  Fk_Employees_Role,
--												  CONSTRAINT Fk_Employees_Department, 
--												  CONSTRAINT Fk_Employees_Address;

											
--											-- DROPPING SELF LOOP FK 
--											ALTER TABLE EMPLOYEES 
--											DROP CONSTRAINT Fk_Employees_Manager,
--											-- ADDING FK AFTER TRUNCATING 
--											--1
--											GO
--											ALTER TABLE EMPLOYEES  
--											WITH CHECK ADD CONSTRAINT Fk_Employees_Role FOREIGN KEY(RoleID)
--											REFERENCES ROLES(RoleID)
--											ON UPDATE CASCADE
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE EMPLOYEES CHECK CONSTRAINT Fk_Employees_Role
--											GO
--											--2
--											GO
--											ALTER TABLE EMPLOYEES  
--											WITH CHECK ADD CONSTRAINT Fk_Employees_Department FOREIGN KEY(DepartmentID)
--											REFERENCES DEPARTMENTS(DepartmentID)
--											ON UPDATE CASCADE
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE EMPLOYEES CHECK CONSTRAINT Fk_Employees_Department
--											GO
--											--3
--											GO
--											ALTER TABLE EMPLOYEES  
--											WITH CHECK ADD CONSTRAINT Fk_Employees_Manager FOREIGN KEY(EmployeeID)
--											REFERENCES EMPLOYEES (EmployeeID)
--											ON DELETE NO ACTION 
--											ON UPDATE NO ACTION
--											GO
--											ALTER TABLE EMPLOYEES CHECK CONSTRAINT Fk_Employees_Manager
--											GO
--											--4
--											GO
--											ALTER TABLE EMPLOYEES  
--											WITH CHECK ADD CONSTRAINT Fk_Employees_Address FOREIGN KEY(EmpAddressID)
--											REFERENCES EMPLOYEEADDRESS(EmpAddressID)
--											ON DELETE NO ACTION 
--											ON UPDATE NO ACTION
--											GO
--											ALTER TABLE EMPLOYEES CHECK CONSTRAINT Fk_Employees_Address
--											GO
--											-- CHECKING DATA VALUES
--											SELECT * FROM EMPLOYEES;

--TRUNCATE TABLE EMPLOYEEPERSONAL		
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE EMPLOYEEPERSONAL 
--											DROP CONSTRAINT Fk_Employeepersonal_Employees;
--											-- ADDING FK AFTER TRUNCATING 
--											ALTER TABLE EMPLOYEEPERSONAL  
--											WITH CHECK ADD CONSTRAINT Fk_Employeepersonal_Employees FOREIGN KEY(EmployeeID)
--											REFERENCES EMPLOYEES (EmployeeID)
--											ON UPDATE CASCADE
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE EMPLOYEEPERSONAL CHECK CONSTRAINT Fk_Employeepersonal_Employees
--											GO
--											-- CHECKING DATA VALUES
--											SELECT * FROM EMPLOYEEPERSONAL;

--TRUNCATE TABLE ROLES						
--			-- REFERED BY EMPLOYEES
											

--TRUNCATE TABLE EMPLOYEEADDRESS			   
--			-- REFERED BY EMPLOYEES AND DEPARTMENTS
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE EMPLOYEEADDRESS 
--											DROP CONSTRAINT Fk_Employeeaddress_Country;
--											-- ADDING FK AFTER TRUNCATING 
--											ALTER TABLE EMPLOYEEADDRESS  
--											WITH CHECK ADD CONSTRAINT Fk_Employeeaddress_Country FOREIGN KEY(CountryID)
--											REFERENCES COUNTRIES (CountryID)
--											ON UPDATE CASCADE
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE EMPLOYEEADDRESS CHECK CONSTRAINT Fk_Employeeaddress_Country
--											GO
--											-- CHECKING DATA VALUES
--											SELECT * FROM EMPLOYEEADDRESS;
											
--TRUNCATE TABLE DEPARTMENTS				
--			-- REFERED BY EMPLOYEES, 
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE DEPARTMENTS 
--											DROP CONSTRAINT Fk_Departments_Facility;
--											-- ADDING FK AFTER TRUNCATING 
--											ALTER TABLE DEPARTMENTS  
--											WITH CHECK ADD CONSTRAINT Fk_Departments_Facility FOREIGN KEY(FacilityID)
--											REFERENCES FACILITYADDRESS (FacilityID)
--											ON UPDATE CASCADE
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE DEPARTMENTS CHECK CONSTRAINT Fk_Departments_Facility
--											GO
--											-- CHECKING DATA VALUES
--											SELECT * FROM DEPARTMENTS;
--TRUNCATE TABLE ADDRESS

--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE ADDRESS 
--											DROP CONSTRAINT Fk_ADDRESS_FACILITYADDRESS;
--											-- ADDING FK AFTER TRUNCATING 
--											ALTER TABLE ADDRESS 
--											WITH CHECK ADD CONSTRAINT Fk_ADDRESS_FACILITYADDRESS 
--											FOREIGN KEY (FacilityID)
--											REFERENCES FACILITYADDRESS(FacilityID) 
--											ON UPDATE CASCADE 
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE ADDRESS CHECK CONSTRAINT Fk_ADDRESS_FACILITYADDRESS
--											GO

--TRUNCATE TABLE FACILITYADDRESS	
--			-- REFERED BY COUNTRIES, ADDRESS, DEPARTMENTS, EMPLOYEECONTACTS
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE FACILITYADDRESS 
--											DROP CONSTRAINT Fk_ADDRESS_country;
--											-- ADDING FK AFTER TRUNCATING 
--											ALTER TABLE FACILITYADDRESS  
--											WITH CHECK ADD CONSTRAINT Fk_ADDRESS_country FOREIGN KEY(CountryID)
--											REFERENCES COUNTRIES (CountryID)
--											ON UPDATE CASCADE
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE FACILITYADDRESS CHECK CONSTRAINT Fk_ADDRESS_country
--											GO
--											-- CHECKING DATA VALUES
--											SELECT * FROM FACILITYADDRESS;
--TRUNCATE TABLE COUNTRIES					
--											--DROPING FK TO USE TRUNCATE 
--											ALTER TABLE COUNTRIES 
--											DROP CONSTRAINT FK_Countries_Region;


--TRUNCATE TABLE REGIONS					
--			-- REFERED BY COUNTRIES
--											-- ADDING FK AFTER TRUNCATING 
--											ALTER TABLE COUNTRIES  
--											WITH CHECK ADD CONSTRAINT FK_Countries_Region FOREIGN KEY(RegionID)
--											REFERENCES REGIONS(RegionID)
--											ON UPDATE CASCADE
--											ON DELETE CASCADE
--											GO
--											ALTER TABLE COUNTRIES CHECK CONSTRAINT FK_Countries_Region
--											GO
--											-- CHECKING DATA VALUES
--											SELECT * FROM COUNTRIES;


--GO
--DBCC CHECKIDENT ('DEPARTMENTS', RESEED, 0);
--GO
											
--DELETE FROM DEPARTMENTS;
