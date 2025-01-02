CREATE DATABASE task2
USE task2

CREATE SCHEMA Q2

--1.Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE Q2.Employees
(
	id INT ,
	name VARCHAR(50),
	salary DECIMAL(10,2)
)

--2.Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE Q2.Employees
ADD Department VARCHAR(50)

--3.Remove the "Salary" column from the "Employees" table.
ALTER TABLE Q2.Employees
DROP COLUMN salary

--4.Rename the "Department" column in the "Employees" table to "DeptName".
EXEC SP_RENAME 'Q2.Employees.Department' , 'DeptName'

--5.Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Q2.Projects
(
	project_id INT ,
	project_name VARCHAR(50)
)
--6.Add a primary key constraint to the "Employees" table for the "ID" column.
--https://www.sqlservertutorial.net/sql-server-basics/sql-server-not-null-constraint/ استخدمت الموقع للفهم
ALTER TABLE Q2.Employees
ALTER COLUMN id INT NOT NULL
ALTER TABLE Q2.Employees
ADD PRIMARY KEY(id)


--7.Add a unique constraint to the "Name" column in the "Employees" table.
--https://www.sqlservertutorial.net/sql-server-basics/sql-server-unique-constraint/ استخدمت الموقع للكود
ALTER TABLE Q2.Employees
ADD CONSTRAINT name  UNIQUE(name) 

/*8.Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar),
and Email (varchar), and Status (varchar).*/
CREATE TABLE Q2.Customers
(
	cus_id INT ,
	frist_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	status VARCHAR(100),
)

--9.Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE Q2.Customers
ADD CONSTRAINT FName  UNIQUE(frist_name)
ALTER TABLE Q2.Customers
ADD CONSTRAINT LName  UNIQUE(last_name)

/*10.Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer),
OrderDate (datetime), and TotalAmount (decimal).*/
CREATE TABLE Q2.Orders
(
	ord_id INT,
	cus_id INT,
	orderdate DATETIME,
	totalamount DECIMAL(11,2)
)
--11.Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
--https://www.sqlservertutorial.net/sql-server-basics/sql-server-check-constraint/ استخدمت الموقع للكود
ALTER TABLE Q2.Orders
ADD CONSTRAINT ch_totalamount CHECK(totalamount > 0)

--12.Create a schema named "Sales" and move the "Orders" table into this schema.
USE task2
CREATE SCHEMA Sales
ALTER SCHEMA Sales TRANSFER Q2.Orders

--13.Rename the "Orders" table to "SalesOrders."
EXEC SP_RENAME 'Sales.Orders' , 'SalesOrders'