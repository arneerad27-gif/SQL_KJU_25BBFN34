CREATE DATABASE StaffPayrollDB;
USE StaffPayrollDB;

CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(80) NOT NULL,
    dept_id INT NOT NULL,
    job_title VARCHAR(60) NOT NULL,
    employment_type VARCHAR(15) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    performance_rating DECIMAL(2,1) NULL,
    status VARCHAR(15) NOT NULL DEFAULT 'Active',
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salary_payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    pay_month DATE NOT NULL,
    basic_pay DECIMAL(10,2) NOT NULL,
    bonus DECIMAL(10,2) NOT NULL DEFAULT 0,
    deductions DECIMAL(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE leave_records (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    leave_type VARCHAR(15) NOT NULL,
    start_date DATE NOT NULL,
    days INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments (dept_name, location) VALUES
('Human Resources', 'Thiruvananthapuram'),
('Finance', 'Kozhikode'),
('Information Technology', 'Coimbatore'),
('Marketing', 'Bengaluru'),
('Operations', 'Madurai'),
('Legal', 'Thiruvananthapuram');

INSERT INTO employees
(emp_name, dept_id, job_title, employment_type, hire_date,
 salary, performance_rating, status) VALUES
('Arun Kumar',       1, 'HR Manager',            'Full-time', '2019-06-10',  97000, 4.5, 'Active'),
('Lakshmi Nair',     1, 'HR Executive',          'Full-time', '2022-09-12',  44000, 4.2, 'Active'),
('Nithya Menon',     1, 'HR Executive',          'Full-time', '2026-07-20',  42000, NULL, 'Active'),
('Sanjay Rao',       1, 'Recruiter',             'Contract',  '2025-04-14',  40000, 3.8, 'Active'),
('Deepa Krishnan',   2, 'Finance Manager',       'Full-time', '2018-08-13', 101000, 4.6, 'Active'),
('Manoj Pillai',     2, 'Accountant',            'Full-time', '2021-04-19',  51000, 4.1, 'Active'),
('Rohit Sharma',     2, 'Financial Analyst',     'Full-time', '2020-12-21',  66000, 4.3, 'Active'),
('Sneha Das',        2, 'Accountant',            'Full-time', '2023-06-05',  48000, 3.7, 'Active'),
('Prakash Iyer',     3, 'IT Manager',            'Full-time', '2017-03-06', 127000, 4.8, 'Active'),
('Anand Verma',      3, 'Software Engineer',     'Full-time', '2021-10-11',  84000, 4.4, 'Active'),
('Geetha Joseph',    3, 'Software Engineer',     'Full-time', '2022-03-14',  79000, 4.2, 'Active'),
('Vivek Raj',        3, 'Data Analyst',          'Full-time', '2023-07-17',  71000, 4.0, 'Active'),
('Rahul Thomas',     3, 'Software Engineer',     'Contract',  '2025-10-12',  73000, NULL, 'Active'),
('Farah Ali',        3, 'QA Engineer',           'Full-time', '2024-05-13',  61000, 3.9, 'Active'),
('Madhavi Rao',      4, 'Marketing Manager',     'Full-time', '2020-05-18',  95000, 4.4, 'Active'),
('Kiran Bhat',       4, 'Digital Marketer',      'Full-time', '2022-12-12',  57000, 4.1, 'Active'),
('Naveen Kumar',     4, 'Brand Executive',       'Full-time', '2023-04-10',  50000, 3.6, 'Resigned'),
('Suma Reddy',       5, 'Operations Manager',    'Full-time', '2019-02-11',  92000, 4.5, 'Active'),
('Ajay Menon',       5, 'Logistics Coordinator', 'Full-time', '2022-02-14',  47000, 3.9, 'Active'),
('Pooja Sharma',     5, 'Supply Chain Analyst',  'Full-time', '2020-08-17',  63000, 4.2, 'Active'),
('Irfan Khan',       5, 'Warehouse Supervisor',  'Contract',  '2025-12-01',  38000, NULL, 'Active');

INSERT INTO leave_records (emp_id, leave_type, start_date, days) VALUES
(1,  'Earned', '2026-07-10', 3),
(2,  'Casual', '2026-07-18', 1),
(2,  'Sick',   '2026-08-24', 2),
(6,  'Casual', '2026-07-25', 1),
(6,  'Earned', '2026-09-11', 4),
(7,  'Earned', '2026-09-25', 5),
(9,  'Casual', '2026-08-03', 1),
(10, 'Sick',   '2026-08-08', 2),
(10, 'Casual', '2026-09-22', 1),
(11, 'Earned', '2026-07-31', 3),
(12, 'Casual', '2026-08-16', 1),
(14, 'Sick',   '2026-09-06', 2),
(15, 'Sick',   '2026-08-21', 2),
(16, 'Casual', '2026-07-13', 1),
(16, 'Earned', '2026-08-28', 4),
(18, 'Casual', '2026-09-28', 1),
(19, 'Sick',   '2026-09-15', 2),
(20, 'Casual', '2026-09-01', 1);

SELECT
    (SELECT COUNT(*) FROM departments) AS departments,
    (SELECT COUNT(*) FROM employees) AS employees,
    (SELECT COUNT(*) FROM salary_payments) AS payments,
    (SELECT COUNT(*) FROM leave_records) AS leaves;

SELECT COUNT(*) AS total_employees
FROM employees;

SELECT COUNT(*) AS active_employees
FROM employees
WHERE status = 'Active';

SELECT COUNT(*) AS all_employees,
       COUNT(performance_rating) AS employees_with_a_rating
FROM employees;

SELECT COUNT(DISTINCT job_title) AS different_job_titles,
       COUNT(DISTINCT dept_id) AS departments_with_staff
FROM employees;

SELECT SUM(salary) AS monthly_salary_bill
FROM employees
WHERE status = 'Active';

SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees
WHERE status = 'Active';

SELECT MIN(salary) AS lowest_salary,
       MAX(salary) AS highest_salary
FROM employees
WHERE status = 'Active';

SELECT COUNT(*) AS headcount,
       SUM(salary) AS total_salary,
       ROUND(AVG(salary), 2) AS average_salary,
       MIN(salary) AS lowest_salary,
       MAX(salary) AS highest_salary
FROM employees
WHERE status = 'Active';

SELECT SUM(salary) AS monthly_payroll,
       SUM(salary) * 12 AS yearly_payroll
FROM employees
WHERE status = 'Active';

SELECT ROUND(AVG(performance_rating), 2) AS avg_rating_ignoring_null,
       ROUND(SUM(performance_rating) / COUNT(*), 2) AS sum_divided_by_all_rows
FROM employees;

SELECT MIN(hire_date) AS first_joiner_date,
       MAX(hire_date) AS latest_joiner_date,
       MIN(emp_name) AS first_name_alphabetically,
       MAX(emp_name) AS last_name_alphabetically
FROM employees;

SELECT emp_name, job_title, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE status = 'Active'
);