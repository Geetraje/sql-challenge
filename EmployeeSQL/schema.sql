--Create a table for employees

CREATE TABLE employees(
	emp_no int PRIMARY KEY NOT NULL,
	emp_title_id varchar(6) NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	sex char NOT NULL,
	hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

select *
from employees;

--Create a table for salaries
CREATE TABLE salaries(
	emp_no int PRIMARY KEY NOT NULL,
	salary int NOT NULL)
;

select *
from salaries;

--Create a table for department managers
CREATE TABLE dept_manager(
	dept_no varchar(5) NOT NULL,
	emp_no int NOT NULL)
;

select *
from dept_manager;

--Create a table for dept_emp
CREATE TABLE dept_emp(
	emp_no int NOT NULL,
	dept_no varchar(5) NOT NULL)
;	

select *
from dept_emp;

-- Create a table for departments
CREATE TABLE departments(
	dept_no varchar(5) NOT NULL,
	dept_name varchar(20) NOT NULL)
;

select *
from departments;

--Create a table for titles
CREATE TABLE titles(
	title_id varchar(6) NOT NULL,
	title char(20) NOT NULL)
;

select *
from titles;