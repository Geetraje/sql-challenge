--Create a table for employees

CREATE TABLE employees(
	emp_no int PRIMARY KEY NOT NULL,
	emp_title_id varchar NOT NULL,
	birth_date varchar NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
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
	dept_no varchar NOT NULL,
	emp_no int NOT NULL)
;

select *
from dept_manager;

--Create a table for dept_emp
CREATE TABLE dept_emp(
	emp_no int NOT NULL,
	dept_no varchar NOT NULL)
;	

select *
from dept_emp;

-- Create a table for departments
CREATE TABLE departments(
	dept_no varchar NOT NULL,
	dept_name varchar NOT NULL)
;

select *
from departments;

--Create a table for titles
CREATE TABLE titles(
	title_id varchar NOT NULL,
	title char NOT NULL)
;

select *
from titles;

--To list last name, first name, sex and salary of each employee
select employees.emp_no, last_name,first_name, sex, salaries.salary 
from employees
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--To list first name first name, last name and hire date for employees hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date BETWEEN '1986-1-1' AND '1986-12-31';

--To display managers in each department with department number, employee number, last and first name
select dept_manager.dept_no, dept_manager.emp_no, employees.last_name, first_name
from dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--To display employee number,last and first name, department number and name of department
select employees.emp_no,last_name,first_name, dept_emp.dept_no, departments.dept_name
from employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--To display first, last name and sex of all employees with Hercules as first name and a last name starting with B
select first_name, last_name, sex
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%';

--To list all employee numbers, last and first name in the Sales Department 
select employees.emp_no,last_name,first_name
from employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';


-- To list employee number, last and first name for all employees in the Sales and the Development department
select employees.emp_no,last_name,first_name, departments.dept_name
from employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';


--To list in descending order, the frequency of occurence of last names
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name HAVING COUNT(*)>1 
ORDER BY COUNT(*) DESC;

