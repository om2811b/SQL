
-- Q.21
CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT NULL,
	CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE SET NULL
);


-- Q.22
ALTER TABLE employee 
DROP FOREIGN KEY fk_emp_dept;


-- Q.23
ALTER TABLE employee
ADD CONSTRAINT fk_manager 
FOREIGN KEY (manager_id) REFERENCES employee(emp_id);


-- Q.24
CREATE TABLE accounts (
	id INT,
	balance DECIMAL(10,2)
    CHECK (balance >= 0)
);


-- Q.25
INSERT INTO accounts(id,balance) VALUES(1,-100);


-- Q.26
ALTER TABLE accounts
ADD CONSTRAINT bal_check CHECK(balance BETWEEN 10 AND 1000000);


-- Q.27
INSERT INTO accounts (id,balance) VALUES (2,50);


-- Q.28
CREATE TABLE invoices (
	invoice_id INT AUTO_INCREMENT PRIMARY KEY
);
INSERT INTO invoices VALUES ();
INSERT INTO invoices VALUES ();
INSERT INTO invoices VALUES ();


-- Q.29
DELETE FROM invoices
WHERE invoice_id = 3;
INSERT INTO invoices VALUES();


-- Q.30
ALTER TABLE users
ADD CONSTRAINT uq_phone UNIQUE (phone);
ALTER TABLE users
DROP INDEX uq_phone;


-- Q.31
CREATE TABLE library (
	book_id INT, 
    branch_id INT,
    isbn VARCHAR(50),
    PRIMARY KEY (book_id, branch_id),
    UNIQUE (isbn, branch_id)
);


-- Q.32
INSERT INTO library VALUES (1, 101, 'A123');
INSERT INTO library VALUES (1, 101, 'A123');
-- Error Code: 1062. Duplicate entry '1-101' for key 'library.PRIMARY'


-- Q.33
INSERT INTO library VALUES (1, 102, 'A123');


-- Q.34
CREATE TABLE users (
	id INT PRIMARY KEY,
    email VARCHAR(50),
    phone VARCHAR(20),
    username VARCHAR(50),
    UNIQUE (id),
    UNIQUE (email),
    UNIQUE (phone)
);


-- Q.35
CREATE TABLE prime (
	id INT PRIMARY KEY,
    UNIQUE (id)
);


-- Q.36
CREATE TABLE exam_results (
	student_id INT,
    exam_id INT,
    marks INT,
    PRIMARY KEY (student_id, exam_id),
    CHECK (marks BETWEEN 0 AND 100)
);


-- Q.37
CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
		ON UPDATE CASCADE
);
UPDATE customers
SET customer_id = 200 WHERE customer_id = 100;


-- Q.38
CREATE TABLE categories (
	category_id INT,
    category_name VARCHAR(20)
);
CREATE TABLE products (
	prod_id INT,
    prod_name VARCHAR(20),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
		ON DELETE CASCADE
);


-- Q.39
CREATE TABLE categories (
	id INT,
    name VARCHAR(20),
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES categories (id)
);
INSERT INTO categories VALUES (1, 'Electronics',NULL);
INSERT INTO categories VALUES (2, 'Phones',1002);


-- Q.40
ALTER TABLE categories ;
DELETE FROM categories WHERE id = 1;


-- Q.41
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO employee VALUES (1, 'Asha', 101);
SET FOREIGN_KEY_CHECKS = 1;


-- Q.42
SET FOREIGN_KEY_CHECKS = 1;


-- Q.43
CREATE TABLE department (
	dept_id INT PRIMARY KEY
);
CREATE TABLE employee (
	emp_id INT PRIMARY KEY,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department (dept_id)
);
SHOW INDEX FROM employee;


-- Q.44
CREATE TABLE employees (
	id INT,
    salary DECIMAL(10,2),
    CHECK (salary > 20000)
);

-- Q.45
INSERT INTO employees VALUES (1, 15000);
-- Error Code: 3819. Check constraint 'employees_chk_1' is violated.


-- Q.46
ALTER TABLE employees
ADD gender CHAR(1),
ADD CONSTRAINT check_gender
CHECK (gender IN ('M', 'F'));


-- Q.47
INSERT INTO employees VALUES (1, 25000, 'X');
-- Error Code: 3819. Check constraint 'check_gender' is violated.


-- Q.48
ALTER TABLE employees 
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (dept_id) REFERENCES department(dept_id);


-- Q.49
ALTER TABLE library
DROP PRIMARY KEY;


-- Q.50
ALTER TABLE employees
DROP FOREIGN KEY fk_emp_dept;

ALTER TABLE employees
ADD CONSTRAINT fk_employee_department 
FOREIGN KEY (dept_id) REFERENCES department (dept_id);

