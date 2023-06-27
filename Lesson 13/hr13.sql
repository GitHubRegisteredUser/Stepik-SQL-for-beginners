CREATE TABLE emp1000 AS
SELECT first_name, last_name, salary, department_id FROM employees;

CREATE FORCE VIEW v1000 AS
SELECT first_name, last_name, salary, department_name, e.city
FROM emp1000 e JOIN departments d ON (e.department_id = d.department_id);

ALTER TABLE emp1000 ADD(city VARCHAR(30));

ALTER VIEW v1000 COMPILE;

CREATE SYNONYM syn1000 FOR v1000;

DROP VIEW v1000;

DROP SYNONYM syn1000;

DROP TABLE emp1000;

CREATE SEQUENCE seq1000 INCREMENT BY 4 START WITH 12 MAXVALUE 200 CYCLE;

ALTER SEQUENCE seq1000 NOMAXVALUE NOCYCLE;

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (seq1000.nextval, 'Ivanov', 'PIVANOV', SYSDATE, 'IT_PROG');

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (seq1000.nextval, 'Petrov', 'IPETROV', SYSDATE, 'IT_PROG');

COMMIT;
