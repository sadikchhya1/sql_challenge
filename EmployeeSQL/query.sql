-- DATA ANALYSIS

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
		FROM employees
		INNER JOIN salaries ON
		employees.emp_no = salaries.emp_no
		ORDER BY employees.emp_no;
        
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
	FROM employees
	WHERE EXTRACT(year FROM hire_date) = 1986
	ORDER BY emp_no;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT  dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
		FROM departments
		JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
		JOIN employees
		ON dept_manager.emp_no = employees.emp_no
		ORDER BY last_name DESC
		
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
		FROM employees
		JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
		JOIN departments 
		ON dept_emp.dept_no = departments.dept_no
		ORDER BY dept_name
		
		
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
		FROM employees
		WHERE first_name = 'Hercules'
		AND last_name LIKE 'B%'
		
		
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
		FROM employees
		JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
		JOIN departments 
		ON dept_emp.dept_no = departments.dept_no
		WHERE departments.dept_name = 'Sales';
		
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
		FROM employees
		JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
		JOIN departments 
		ON dept_emp.dept_no = departments.dept_no
		WHERE departments.dept_name in ('Sales', 'Development')
		ORDER BY dept_name 

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(employees.last_name) AS count_of_emp_lastnames
		FROM employees
		Group BY employees.last_name
		ORDER BY  count_of_emp_lastnames DESC;
		
		