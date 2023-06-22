SELECT * FROM employees
WHERE LENGTH(first_name) = (SELECT MAX(LENGTH(first_name)) FROM employees);

SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT city
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
GROUP BY city
HAVING SUM(salary) = (SELECT MIN(SUM(salary))
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
GROUP BY city);

SELECT * FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees WHERE salary > 15000);

SELECT * FROM departments WHERE department_id NOT IN
(SELECT DISTINCT department_id FROM employees WHERE department_id IS NOT NULL);

SELECT * FROM employees WHERE employee_id NOT IN
(SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL);

SELECT * FROM employees e
WHERE (SELECT COUNT(*) FROM employees WHERE manager_id = e.employee_id) > 6;

SELECT * FROM employees WHERE department_id = 
(SELECT department_id FROM departments WHERE department_name = 'IT');

SELECT * FROM employees WHERE manager_id IN
(SELECT employee_id FROM employees WHERE TO_CHAR(hire_date, 'YYYY') = '2005')
AND hire_date < TO_DATE('01-01-2005', 'DD-MM-YYYY');

SELECT * FROM employees e WHERE manager_id IN
(SELECT employee_id FROM employees WHERE TO_CHAR(hire_date, 'MM') = '01')
AND (SELECT LENGTH(job_title) FROM jobs WHERE job_id = e.job_id) > 15;
