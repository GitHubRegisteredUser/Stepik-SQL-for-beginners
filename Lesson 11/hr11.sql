CREATE TABLE friends AS
SELECT employee_id id, first_name name, last_name surname FROM employees
WHERE commission_pct IS NOT NULL;

ALTER TABLE friends ADD(email VARCHAR2(30));

ALTER TABLE friends MODIFY(email VARCHAR2(30) DEFAULT 'no email');

INSERT INTO friends (id, name, surname) VALUES (300, 'John', 'Doe');

ALTER TABLE friends RENAME COLUMN id TO friends_id;

DROP TABLE friends;

CREATE TABLE friends(
id INTEGER,
name VARCHAR2(30),
surname VARCHAR2(30),
email VARCHAR2(30),
salary NUMBER (8, 2) DEFAULT 0,
birthday DATE DEFAULT TO_DATE('01-01-2000', 'DD-MM-YYYY')
);

INSERT INTO friends VALUES (1, 'Van', 'Darkholme', 'vandarkholme.com@gmail.com',
999999.99, TO_DATE('24-10-1972', 'DD-MM-YYYY'));

INSERT INTO friends (id, name, surname, email)
VALUES (2, 'Joe', 'Average', 'ajoe123@gmail.com');

COMMIT;

ALTER TABLE friends DROP COLUMN salary;

ALTER TABLE friends SET UNUSED COLUMN email;

ALTER TABLE friends SET UNUSED COLUMN birthday;

ALTER TABLE friends DROP UNUSED COLUMNS;

ALTER TABLE friends READ ONLY;

INSERT INTO friends VALUES (3, 'Jane', 'Doe', 'janedoe123@gmail.com');

TRUNCATE TABLE friends;

DROP TABLE FRIENDS;
