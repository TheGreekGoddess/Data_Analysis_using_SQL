-- Create a table for Employees
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL
	);
	
-- Unindent and drop table if this specific table already exists in the database
-- DROP TABLE employees;

-- Check if the data has been imported accurately
SELECT *
FROM employees
LIMIT 11;

--------------------------------------------------
-- Create a table for Employee salaries
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);

-- Unindent and drop table if this specific table already exists in the database
-- DROP TABLE salaries;

-- Check if the data has been imported accurately
SELECT *
FROM salaries
LIMIT 11;

--------------------------------------------------
-- Create a table for Employee titles
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);

-- Unindent and drop table if this specific table already exists in the database
-- DROP TABLE titles;

-- Check if the data has been imported accurately
SELECT *
FROM titles
LIMIT 11;

--------------------------------------------------
-- Create a table for Departments
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR NOT NULL
	);

-- Unindent and drop table if this specific table already exists in the database
-- DROP TABLE departments;

-- Check if the data has been imported accurately
SELECT *
FROM departments
LIMIT 11;

--------------------------------------------------
-- Create a table for Department employees
CREATE TABLE department_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
	);

-- Unindent and drop table if this specific table already exists in the database
-- DROP TABLE department_employees;

-- Check if the data has been imported accurately
SELECT *
FROM department_employees
LIMIT 11;

--------------------------------------------------
-- Create a table for Department managers
CREATE TABLE department_managers (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	);

-- Unindent and drop table if this specific table already exists in the database
-- DROP TABLE department_managers;

-- Check if the data has been imported accurately
SELECT *
FROM department_managers
LIMIT 11;