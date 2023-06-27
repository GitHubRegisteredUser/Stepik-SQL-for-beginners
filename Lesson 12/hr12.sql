CREATE TABLE address(
id INTEGER CONSTRAINT ad_id_un UNIQUE,
country VARCHAR2(30),
city VARCHAR2(30)
);

CREATE TABLE friends(
id INTEGER,
name VARCHAR2(30),
email VARCHAR2(30),
address_id INTEGER CONSTRAINT fk_ct REFERENCES address(id) ON DELETE SET NULL,
birthday DATE,
CONSTRAINT ch CHECK(LENGTH(name) > 3)
);

CREATE UNIQUE INDEX fr_id_un_in ON friends(id);

ALTER TABLE friends ADD CONSTRAINT fr_id_pk PRIMARY KEY (id);

CREATE INDEX fr_em_in ON friends(email);

ALTER TABLE friends MODIFY (email CONSTRAINT fr_email_nn NOT NULL);

DROP TABLE friends;

DROP TABLE address;
