CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1 = 2);

INSERT INTO locations2 (location_id, street_address, city, country_id)
VALUES (5000, 'Street address 1', 'City 1', 'IT');
INSERT INTO locations2 (location_id, street_address, city, country_id)
VALUES (5100, 'Street address 2', 'City 2', 'IT');

COMMIT;

INSERT INTO locations2 VALUES (5200, 'Street address 3', 'PC 3',
'City 3', 'Province 3', UPPER('fr'));
INSERT INTO locations2 VALUES (5300, 'Street address 4', 'PC 4',
'City 4', 'Province 4', UPPER('fr'));

COMMIT;

INSERT INTO locations2 SELECT * FROM locations WHERE LENGTH(state_province) > 9;

COMMIT;

CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1 = 2);

INSERT ALL
WHEN 2 * 2 = 4 THEN
INTO locations2 VALUES (location_id, street_address, postal_code, city,
state_province, country_id)
WHEN country_id IN (SELECT country_id FROM countries WHERE region_id = 1) THEN
INTO locations4europe (location_id, street_address, city, country_id)
VALUES (location_id, street_address, city, country_id)
SELECT * FROM locations;

COMMIT;

SELECT * FROM locations2;

UPDATE locations2 SET postal_code = 'Random PC' WHERE postal_code IS NULL;

ROLLBACK;

UPDATE locations2 SET postal_code = (SELECT postal_code FROM locations
WHERE location_id = 2600) WHERE postal_code IS NULL;

COMMIT;

DELETE FROM locations2 WHERE country_id = 'IT';

SAVEPOINT s1;

UPDATE locations2 SET street_address = 'Sezam st. 18' WHERE location_id > 2500;

SAVEPOINT s2;

DELETE FROM locations2 WHERE street_address = 'Sezam st. 18';

ROLLBACK TO SAVEPOINT s1;

COMMIT;
