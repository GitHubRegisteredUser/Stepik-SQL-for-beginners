SELECT department_id, COUNT(*), MIN(salary), MAX(salary), MIN(hire_date),
MAX(hire_date) FROM employees GROUP BY department_id ORDER BY 2 DESC;

SELECT SUBSTR(first_name, 1, 1) first_char, COUNT(*) FROM employees
GROUP BY SUBSTR(first_name, 1, 1) HAVING COUNT(*) > 1 ORDER BY 2;

SELECT department_id, salary, COUNT(*) FROM employees
GROUP BY department_id, salary;

SELECT TO_CHAR(hire_date, 'Day') day, COUNT(*) FROM employees
GROUP BY TO_CHAR(hire_date, 'Day');

SELECT department_id FROM employees
GROUP BY department_id HAVING COUNT(*) > 30 AND SUM(salary) > 300000;

SELECT region_id FROM countries
GROUP BY region_id HAVING SUM(LENGTH(country_name)) > 50;

SELECT job_id, ROUND(AVG(salary)) avg_salary FROM employees GROUP BY job_id;

SELECT department_id FROM employees
GROUP BY department_id HAVING COUNT(DISTINCT(job_id)) > 1;

SELECT department_id, job_id, MIN(salary), MAX(salary) FROM employees
GROUP BY department_id, job_id HAVING AVG(salary) > 10000;

SELECT manager_id FROM employees WHERE commission_pct IS NULL
GROUP BY manager_id HAVING AVG(salary) BETWEEN 6000 AND 9000;

SELECT ROUND(MAX(AVG(salary)), -3) max_avg_salary FROM employees
GROUP BY department_id;
