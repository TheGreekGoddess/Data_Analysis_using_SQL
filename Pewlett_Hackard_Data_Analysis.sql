-- Q1: List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	employees.gender AS "Gender",
	salaries.salary AS "Salary"
FROM
	employees
RIGHT JOIN
	salaries
ON
	employees.emp_no = salaries.emp_no
ORDER BY last_name, first_name ASC;

-- Q2: List employees who were hired in 1986.
SELECT
	emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name",
	hire_date AS "Start of Employment"
FROM
	employees
WHERE
	hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY
	hire_date, last_name, first_name ASC;
 
-- Q3: List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	departments.dept_no AS "Department Number",
	departments.dept_name AS "Department Name",
	department_managers.emp_no AS "Managers Employee Number",
	employees.last_name AS "Last Name",	
	employees.first_name AS "First Name",
	department_managers.from_date AS "Start of Employment",
	department_managers.to_date AS "End of Employment"
FROM
	employees
	JOIN
		department_managers
	ON
		employees.emp_no = department_managers.emp_no
			JOIN
				departments
			ON
				department_managers.dept_no = departments.dept_no
ORDER BY dept_name, last_name ASC;

-- Q4: List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	departments.dept_name AS "Department Name",
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",	
	employees.first_name AS "First Name"
FROM
	employees
	JOIN
		department_managers
	ON
		employees.emp_no = department_managers.emp_no
			JOIN
				departments
			ON
				department_managers.dept_no = departments.dept_no
ORDER BY dept_name, last_name, first_name ASC;

-- Q5: List all employees whose first name is "Hercules" and last names begin with "B."
SELECT
	emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name"
FROM
	employees
WHERE
	first_name LIKE 'Hercules' AND last_name LIKE 'B%'
ORDER BY
	last_name, first_name ASC;

-- Q6: List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	departments.dept_name AS "Department Name",
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",	
	employees.first_name AS "First Name"
FROM
	employees
	JOIN
		department_employees
	ON
		employees.emp_no = department_employees.emp_no
			JOIN
				departments
			ON
				department_employees.dept_no = departments.dept_no
	WHERE dept_name LIKE 'Sales'
ORDER BY dept_name, last_name, first_name ASC;

-- Q7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	departments.dept_name AS "Department Name",
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",	
	employees.first_name AS "First Name"
FROM
	employees
	JOIN
		department_employees
	ON
		employees.emp_no = department_employees.emp_no
			JOIN
				departments
			ON
				department_employees.dept_no = departments.dept_no
	WHERE dept_name LIKE '%Sales%' OR dept_name LIKE '%Development%'
ORDER BY dept_name, last_name, first_name ASC;

-- Q8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	employees.last_name AS "Last Name",
	COUNT (last_name) AS "Frequency"
FROM
	employees
GROUP BY last_name
ORDER BY last_name ASC;