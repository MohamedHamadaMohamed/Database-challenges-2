CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE SCHEMA Sales;

CREATE SEQUENCE Sales.cnt
start with 1
INCREMENT by 1; 

CREATE TABLE Sales.employees
(
employee_id  INT PRIMARY KEY
DEFAULT (NEXT VALUE FOR Sales.cnt),
first_name  VARCHAR(30),
last_name  VARCHAR(30),
salary DECIMAL(10,2),
);

ALTER TABLE Sales.employees
Add hire_date date;
----------------------------------------------------
SELECT *
FROM Sales.employees;

SELECT first_name,last_name 
FROM Sales.employees;

SELECT first_name+' '+last_name AS 'Full Name' 
FROM Sales.employees;

SELECT AVG(Sales.employees.salary)  AS 'average of salary'
FROM Sales.employees;

SELECT *
FROM Sales.employees
WHERE Sales.employees.salary>5000;

SELECT *
FROM Sales.employees
WHERE year(hire_date) = '2020';

SELECT *
FROM Sales.employees
WHERE Sales.employees.last_name like 'S%';

SELECT top(10) *
FROM Sales.employees
order by salary desc

SELECT *
FROM Sales.employees
WHERE salary between 40000 and 60000;


SELECT *
FROM Sales.employees
WHERE first_name like '%man%';

SELECT *
FROM Sales.employees
WHERE hire_date is null;

SELECT *
FROM Sales.employees
WHERE salary in (40000 ,45000, 50000);

SELECT *
FROM Sales.employees
WHERE hire_date between '2020-01-01' and '2021-01-01';

SELECT *
FROM Sales.employees
order by salary desc

SELECT top(5) *
FROM Sales.employees
order by last_name asc;

SELECT *
FROM Sales.employees
WHERE salary >55000 and year(hire_date) = '2020';

SELECT *
FROM Sales.employees
WHERE first_name in ('John','Jane');

SELECT *
FROM Sales.employees
WHERE salary <= 55000 and hire_date >'2022-01-01';

SELECT *
FROM Sales.employees
WHERE salary > (select avg(salary) from Sales.employees);

SELECT * 
FROM(
SELECT * ,ROW_NUMBER() OVER(order by salary Desc) AS HS
FROM  Sales.employees
) as newTable
WHERE HS between 3 and 7;

SELECT * 
FROM  Sales.employees
WHERE hire_date >'2021-01-01'
order by first_name,last_name;

select * 
from Sales.employees
where salary >50000 and last_name not like 'A%'

select * 
from Sales.employees
where salary is not null;

select * 
from Sales.employees
where salary >45000 and (first_name +' '+ last_name)  like '%e%' or
(first_name +' '+ last_name)  like '%i%';

