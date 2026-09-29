use db1;

create table Emp (
	E_id int,
    E_name varchar(50),
    Dept varchar(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Emp VALUES 
(1, 'Ram', 'HR', 10000),
(2, 'Amrit', 'Mrkt', 20000),
(3, 'Ravi', 'HR', 30000),
(4, 'Nitin', 'Mrkt', 40000),
(5, 'Varun', 'IT', 50000);


-- Q.1 Write a SQL query to display maximum salary from Emp table.
--	   Write a SQL query to display E_name who is taking maximum salary from Emp table?

SELECT E_name FROM Emp
WHERE Salary = (SELECT MAX(Salary) FROM Emp);


-- Q.2 Write a SQL query to display second highest salary from Emp table.
-- 	   Write a SQL query to display E_name who is taking second highest salary from Emp table?

SELECT E_name FROM Emp
WHERE Salary = (SELECT MAX(Salary) FROM Emp
				WHERE Salary != (SELECT MAX(Salary) FROM Emp));








