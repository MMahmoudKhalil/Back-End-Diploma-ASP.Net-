
CREATE DATABASE CompanyDB

CREATE SCHEMA Sales

CREATE TABLE Sales.employees
(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	salary DECIMAL(10 , 2)
)

CREATE SEQUENCE Sales.employees_sq
START WITH 1
INCREMENT BY 1

ALTER TABLE Sales.employees
ADD hire_date DATE


SELECT *
FROM Sales.employees


SELECT first_name, last_name
FROM Sales.employees

SELECT first_name+' '+ last_name full_nume
FROM Sales.employees

SELECT AVG(salary) avg_salary
FROM Sales.employees

SELECT salary
FROM Sales.employees
WHERE salary > 50000

SELECT hire_date
FROM Sales.employees
WHERE YEAR (hire_date) = 2020

SELECT *
FROM Sales.employees
WHERE last_name LIKE 'S%'

SELECT TOP 10 *
FROM Sales.employees
ORDER BY salary DESC

SELECT salary
FROM Sales.employees
WHERE salary BETWEEN 40000 AND 60000

SELECT *
FROM Sales.employees
WHERE first_name LIKE '%man%' OR last_name LIKE '%man%'

SELECT hire_date
FROM Sales.employees
WHERE hire_date IS NULL

SELECT salary
FROM Sales.employees
WHERE salary = 40000 AND salary = 45000 AND salary = 50000

SELECT hire_date
FROM Sales.employees
WHERE hire_date BETWEEN '01-01-2020' AND '01-01-2021' 
ORDER BY hire_date ASC

SELECT salary
FROM Sales.employees
ORDER BY salary DESC

SELECT TOP 5 *
FROM Sales.employees
ORDER BY last_name ASC

SELECT * 
FROM Sales.employees
WHERE YEAR(hire_date) = '2020' AND salary > 55000

SELECT *
FROM Sales.employees
WHERE first_name LIKE 'John' OR first_name LIKE 'Jane' 

SELECT * 
FROM Sales.employees
WHERE salary <= 55000 AND hire_date > '2022-01-01'


SELECT AVG(salary)
FROM Sales.employees
SELECT *
FROM Sales.employees
WHERE salary > 54808.842000

SELECT TOP 7 *
FROM Sales.employees
ORDER BY salary DESC
--مساعده من المهندس محمد ممدوح 
SELECT *
FROM ( SELECT TOP 7 *
FROM Sales.employees 
ORDER BY salary DESC
) AS TOP7
ORDER BY salary DESC
OFFSET 2 ROWS




SELECT *
FROM Sales.employees
WHERE hire_date > '2021-01-01'
ORDER BY first_name ASC

SELECT *
FROM Sales.employees
WHERE salary > 50000 AND last_name NOT LIKE 'A%'


SELECT *
FROM Sales.employees
WHERE salary IS NOT NULL

SELECT *
FROM Sales.employees
WHERE first_name LIKE '%e%' OR last_name LIKE '%i%' OR first_name LIKE '%i%' OR last_name LIKE '%e%' AND salary > 45000

