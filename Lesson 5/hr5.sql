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

SELECT SYSDATE, SYSDATE + 1 / 86400 AS plus_second,
SYSDATE + 1 / 1440 AS plus_minute, SYSDATE + 1 / 24 AS plus_hour,
SYSDATE + 1 AS plus_day, ADD_MONTHS(SYSDATE, 1) AS plus_month,
ADD_MONTHS(SYSDATE, 12) AS plus_year FROM dual;

SELECT first_name, salary,
salary + TO_NUMBER('$12,345.55', '$99,999.99') AS new_salary FROM employees;

SELECT first_name, hire_date,
MONTHS_BETWEEN(TO_DATE('SEP, 18:45:00 18 2009', 'MON, HH24:MI:SS DD YYYY'),
hire_date) AS months_passed FROM employees;

SELECT first_name, salary,
TO_CHAR(salary + salary * NVL(commission_pct, 0), '$99,999.99') AS full_salary
FROM employees;

SELECT first_name, last_name,
NVL2(NULLIF(LENGTH(first_name), LENGTH(last_name)),
'different length', 'same length') AS is_same_length FROM employees;

SELECT first_name, commission_pct, NVL2(commission_pct, 'Yes', 'No')
AS has_salary_bonus FROM employees;

SELECT first_name, COALESCE(commission_pct, manager_id, salary) AS info
FROM employees;

SELECT first_name, salary,
CASE
WHEN salary < 5000 THEN 'Low'
WHEN salary >= 5000 AND salary < 10000 THEN 'Normal'
WHEN salary >= 10000 THEN 'High'
END
AS salary_level FROM employees;

SELECT country_name,
DECODE(region_id, 1, 'Europe', 2, 'America', 3, 'Asia', 4, 'Africa')
AS region FROM countries;

SELECT country_name,
CASE region_id
WHEN 1 THEN 'Europe'
WHEN 2 THEN 'Amercia'
WHEN 3 THEN 'Asia'
WHEN 4 THEN 'Africa'
END
AS region FROM countries;

SELECT first_name, salary,
CASE
WHEN salary < 10000 AND commission_pct IS NULL THEN 'BAD'
WHEN salary >= 10000 AND salary < 15000
OR commission_pct IS NOT NULL THEN 'NORMAL'
WHEN salary >= 15000 THEN 'GOOD'
END
AS conditions_level FROM employees;
