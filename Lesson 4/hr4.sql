SELECT * FROM employees
WHERE LENGTH(first_name) > 10;

SELECT * FROM employees
WHERE MOD(salary, 1000) = 0;

SELECT phone_number, SUBSTR(phone_number, 1, 3) FROM employees
WHERE phone_number LIKE '___.___.____';

SELECT * FROM employees
WHERE SUBSTR(first_name, -1) = 'm' AND LENGTH(first_name) > 5;

SELECT NEXT_DAY(SYSDATE, 'ÏßÒÍÈÖÀ') FROM dual;

SELECT * FROM employees
WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 200;

SELECT REPLACE(phone_number, '.', '-') FROM employees;

SELECT RPAD(UPPER(first_name), 20, ' ') || RPAD(LOWER(email), 15, ' ') ||
LPAD(INITCAP(job_id), 15, ' ') FROM employees;

SELECT CONCAT(first_name, salary) FROM employees;

SELECT hire_date, ROUND(hire_date, 'MM'), TRUNC(hire_date, 'YYYY')
FROM employees;

SELECT RPAD(first_name, 10, '$'), LPAD(last_name, 15, '!') FROM employees
WHERE LENGTH(first_name) < 10 AND LENGTH(last_name) < 15;

SELECT first_name, INSTR(LOWER(first_name), 'a', 1, 2) FROM employees;

SELECT '!!!HELLO!!!MYFRIEND!!!!!!!', TRIM('!' FROM '!!!HELLO!!!MYFRIEND!!!!!!!')
FROM dual;

SELECT salary, salary * 3.1415, ROUND(salary * 3.1415),
TRUNC(salary * 3.1415, -3) / 1000 FROM employees;

SELECT hire_date, ADD_MONTHS(hire_date, 6), LAST_DAY(hire_date) FROM employees;
