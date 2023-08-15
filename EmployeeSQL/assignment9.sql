-- Database: assignment_9

-- DROP DATABASE IF EXISTS assignment_9;

/*CREATE DATABASE assignment_9
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Canada.1252'
    LC_CTYPE = 'English_Canada.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
*/	

-- creating tables

-- titles

CREATE TABLE Titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR(25) NOT NULL
);

-- departments

CREATE TABLE Departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- employees 

CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR REFERENCES Titles(title_id),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date DATE
);

-- salaries

CREATE TABLE Salaries (
    emp_no INT REFERENCES Employees(emp_no),
    salary INT NOT NULL,
    PRIMARY KEY (emp_no)
);

-- dept_emp

CREATE TABLE Dept_Emp (
    emp_no INT REFERENCES Employees(emp_no),
    dept_no VARCHAR(50) REFERENCES Departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- dept_manager

CREATE TABLE Dept_Manager (
    emp_no INT REFERENCES Employees(emp_no),
    dept_no VARCHAR(50) REFERENCES Departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);