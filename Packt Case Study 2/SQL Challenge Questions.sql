SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;

-- SQL Challenge Questions

--1. Find the longest ongoing project for each department.

SELECT name FROM
(SELECT *, DENSE_RANK() OVER(PARTITION BY department_id ORDER BY DURATION DESC) AS RNK FROM
(SELECT *, end_date - start_date AS DURATION
FROM projects) ABC) XYZ
WHERE RNK = 1;

--2. Find all employees who are not managers.

SELECT name
FROM employees
WHERE UPPER(job_title) NOT LIKE '%MANAGER';

--3. Find all employees who have been hired after the start of a project in their department.

SELECT e.name, e.hire_date, p.start_date
FROM employees e
JOIN projects p ON e.department_id = p.department_id
WHERE e.hire_date > p.start_date;

--4. Rank employees within each department based on their hire date (earliest hire gets the highest rank).

SELECT *, DENSE_RANK() OVER(PARTITION BY department_id ORDER BY hire_date) AS RANK
FROM employees;

--5. Find the duration between the hire date of each employee and the hire date of the next employee hired in the same department.
SELECT *, hire_date - hd AS DURATION FROM
(SELECT *, LAG(hire_date) OVER(PARTITION BY department_id ORDER BY hire_date) AS hd FROM employees) AS ABC; 
