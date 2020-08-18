--Data Engineering

CREATE TABLE titles(
	title_id VARCHAR(10) NOT NULL PRIMARY KEY,
	title VARCHAR(20) NOT NULL
); 

SELECT * FROM titles;

CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(20) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id), 
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

SELECT * FROM employees;

CREATE TABLE departments(
	dept_no INT NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

SELECT * FROM departments;

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary money NOT NULL
);

SELECT * FROM salaries;

CREATE TABLE dept_emp(
	emp_no INT NOT NULL PRIMARY KEY,
	dept_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

SELECT * FROM dept_manager;
	