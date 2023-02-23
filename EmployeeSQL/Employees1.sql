--To list last name, first name, sex and salary of each employee
select employees.emp_no, last_name,first_name, sex, salaries.salary 
from employees
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--To list first name first name, last name and hire date for employees hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date BETWEEN '1986-1-1' AND '1986-12-31';

--To list managers in each department with department number, employee number, last and first name
select dept_manager.dept_no, dept_manager.emp_no, employees.last_name, first_name
from dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--To list employee number,last and first name, department number and name of department
select employees.emp_no,last_name,first_name, dept_emp.dept_no, departments.dept_name
from employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--To list first, last name and sex of all employees with Hercules as first name and a last name starting with B
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

