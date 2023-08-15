-- Database: assignment9v6

-- DROP DATABASE IF EXISTS assignment9v6;

/* CREATE DATABASE assignment9v6
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Canada.1252'
    LC_CTYPE = 'English_Canada.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
*/	

/* 
I'm having issues with importing the csv files for this assignment.
I can import the titles and department csv files perfectly fine. But, when I get to the employees csv files for
whatever reason I do not understand why it does not import.
I understand I'm supposed to import under a certain order:
    titles, departments, employees, salaries, dept_emp, and dept_manager in that order
Because of the parent-child relationships with the foreign keys and columns involved
My columns are matched up with the csv files 
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
    dept_name VARCHAR(50) NOT NULL
);

-- employees
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR REFERENCES Titles(title_id) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- salaries
CREATE TABLE Salaries (
    emp_no INT REFERENCES Employees(emp_no) NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no)
);

-- dept_emp
CREATE TABLE Dept_Emp (
    emp_no INT REFERENCES Employees(emp_no) NOT NULL,
    dept_no VARCHAR(30) REFERENCES Departments(dept_no) NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);

-- dept_manager
CREATE TABLE Dept_Manager (
    emp_no INT REFERENCES Employees(emp_no) NOT NULL,
    dept_no VARCHAR(30) REFERENCES Departments(dept_no) NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);

