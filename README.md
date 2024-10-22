# SQL-DMBS---Orders-and-Employee-Database

Overview: This project is a three-part endeavor focused on SQL database management, with the final part emphasizing SQL database administration. It extended the Employee Database from the previous project by addressing real-world challenges. Through hands-on SQL tasks, the project involved optimizing database functionality, enhancing usability, and ensuring long-term stability. The scope included solving specific data issues raised by a supervisor, automating processes, and implementing advanced SQL features like user-defined functions and stored procedures.

**PART 1:** **Orders Database and SQL Queries** 
In this project, I worked on the design and querying of an eCommerce orders database using **MS SQL Server Management Studio**. The database consisted of multiple tables, including customer orders, product details, and shipment methods. 

**Key objectives included:**
•	**Database Design:** Implemented the schema for the Orders and Product data stores, populating them with test records adhering to business specifications.
•	**SQL Query Development:** Constructed 20 complex SQL queries to extract meaningful data, such as order totals, shipment methods, and customer order details. Queries ranged from equijoins to subqueries and aggregate functions.
•	**Data Integrity:** Ensured referential integrity between primary and foreign keys across the schemas.
•	**Result Presentation:** Captured and formatted query outputs for presentation.

**Key Skills Utilized:**
•	SQL Querying (SELECT, JOIN, WHERE GROUP BY, and Subqueries)
•	Database Design and Schema Creation
•	Data Validation and Referential Integrity

**PART 2:** **Employee Database and Management** 
In this project, I worked with a human resources database system for a growing company, focusing on database creation, management, and testing using Microsoft Visio for ERD design and SQL scripts for database operations.

•	**Data Modelling:** Designed the employee data model using crow’s foot notation, ensuring entity and attribute relationships for multiple tables such as Employees, Departments, Roles, and EmployeeContacts.
•	**SQL Scripting:** Created CREATE TABLE, INSERT, UPDATE, and DELETE SQL scripts to establish the database, insert and update records, and clean up test data.
•	**Recursive Queries and Views:** Developed complex SQL views to display hierarchical relationships between managers and subordinates, as well as identifying employees without emergency contacts.
• **Testing and Maintenance:** Verified the functionality of the database with test data, ensuring all constraints and relationships were upheld.

**Key Skills Utilized:**
•	SQL Table Creation and Management
•	Entity-Relationship Diagram (ERD) Design
•	Database Constraints (Primary Key, Foreign Key, Default Values)
•	Data Integrity and Maintenance

**Technologies Used:**
•	SQL Server Management Studio
•	Microsoft Visio for database modeling
•	SQL scripting for table creation, data manipulation, and testing.

**Project 3: SQL Database Administration**

**Key tasks and solutions implemented include:**

**1.	Database Modifications:**
o	Issue Resolution: Addressed design flaws in the EmployeePersonal table to allow employees to record multiple allergies. Modified the table design to make the field open-ended, ensuring that HR could correctly file insurance claims.
o	Enhancing Usability: Added intersection tables to allow employees to input multiple addresses, ensuring accurate data without modifying the existing structure.
o	Referential Integrity: Adjusted the PK-PK relationship between EmployeeAddress and Address tables to a PK-FK relationship, stabilizing the database without data loss.

**2.	SQL Scripting**:
o	Custom Function Creation: Developed a user-defined function, LastNameFirst#, to concatenate employee first and last names.
o	Medical Concerns View: Created a view, EmployeesMedicalConcerns, listing employees with known allergies, making it easier for HR to track medical needs.
o	Stored Procedure for Salary Field: Proposed and implemented a stored procedure to format salary data, converting it from INT to CHAR with appropriate currency formatting, improving data presentation.

**3.	Database Performance and Maintenance:**
o	Data Cleansing Automation: Proposed a strategy to automate data cleansing using stored procedures, reducing manual work while maintaining data integrity.
o	Concurrency Control: Considered concurrency issues like dirty reads and non-repeatable reads when managing multiple stored procedures that may conflict, ensuring proper database functionality.

**Key Skills Utilized:**
•	SQL Administration (Database Repair, Optimization, and Usability Enhancements)
•	Writing and Testing SQL Queries, Views, and Stored Procedures
•	Database Security and Integrity (PK-FK Relationships, Referential Integrity)
•	User-defined Functions, Automated Data Cleansing
•	Concurrency Control and Database Stability
