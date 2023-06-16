SELECT * FROM employees
WHERE INSTR(LOWER(first_name), 'b') > 0;

SELECT * FROM employees
WHERE INSTR(LOWER(first_name), 'a', 1, 2) > 0;

SELECT SUBSTR(department_name, 1, INSTR(department_name, ' ') - 1) AS first
FROM departments
WHERE INSTR(department_name, ' ') > 0;

SELECT SUBSTR(first_name, 2, LENGTH(first_name) - 2) AS new_name FROM employees;

SELECT * FROM employees
WHERE LENGTH(SUBSTR(job_id, INSTR(job_id, '_') + 1)) > 3 AND
SUBSTR(job_id, INSTR(job_id, '_') + 1) != 'CLERK';

SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'DD') = '01';

SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2008';

SELECT TO_CHAR(SYSDATE + 1,'fm"Tomorrow is" Ddthsp "of" Month') AS tomorrow
FROM dual;

SELECT first_name, TO_CHAR(hire_date, 'fmDdth "of" Month, YYYY') AS hire_date
FROM employees;

SELECT first_name, TO_CHAR(salary * 1.2, '$99,999.00') AS new_salary
FROM employees;
