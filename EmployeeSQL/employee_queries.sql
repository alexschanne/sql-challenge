--Data Analysis

-- 1. Selecting from each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. Listing employees (first/last name and hire date) who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

-- 3. List the manager of each department with dept_no, dept_name, emp_no, first/last name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d
	ON dm.dept_no = d.dept_no
LEFT JOIN employees AS e
	ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with emp_no, first/last name, and dept_name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no;

-- 5. List first/last name and sex for employee with first name "Hercules" and last name starting with "B".
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in Sales Department, including emp_no, first/last name and dept_name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in Sales and Development departments, including emp_no, first/last name and dept_name. 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE d.dept_name in ('Sales', 'Development');

--8. In descending order, list the frequency count of emp last_names (how many people share each last name).
SELECT last_name, COUNT(last_name) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;


SELECT * FROM employees
WHERE emp_no = 499942;