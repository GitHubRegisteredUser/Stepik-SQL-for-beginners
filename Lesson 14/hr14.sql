CREATE TABLE test200(
id INTEGER,
name1 VARCHAR2(30),
name2 VARCHAR2(30),
address1 VARCHAR2(30),
address2 VARCHAR2(30)
);

UPDATE test200 SET &col = &val1 WHERE id = &val2;

SET VERIFY OFF;

SELECT * FROM test200 WHERE name1 = '&&name_val' AND name1 = '&name_val' AND
name1 = '&&ad_val' AND name1 = '&ad_val';

UNDEFINE name_val;
UNDEFINE ad_val;
