-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--Data Analysis
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employee;
SELECT * FROM salaries;
SELECT * FROM titles;
--1
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.gender, salaries.salary
FROM employee JOIN salaries ON employee.emp_no = salaries.emp_no;
--2
SELECT first_name, last_name, hire_date 
FROM employee WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
--3
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employee ON dept_manager.emp_no = employee.emp_no;
--4
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM dept_emp
JOIN employee ON dept_emp.emp_no = employee.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;
--5List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employee WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
--6list all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM dept_emp
JOIN employee ON dept_emp.emp_no = employee.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
--7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM dept_emp
JOIN employee ON dept_emp.emp_no = employee.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
--8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as freq
from employee
group by last_name
order by freq DESC;


