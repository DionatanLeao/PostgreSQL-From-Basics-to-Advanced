CREATE TABLE tabela_teste(
    id SERIAL
);

CREATE SEQUENCE table_name_id_seq;

CREATE TABLE table_name (
    id integer NOT NULL DEFAULT nextval('table_name_id_seq')
);

ALTER SEQUENCE table_name_id_seq
	OWNED BY table_name.id;

https://www.postgresql.org/docs/current/datatype-numeric.html

CREATE TABLE frutas(
   id SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL
);


INSERT INTO frutas(name) 
	VALUES('Laranja');

Ou:

INSERT INTO frutas(id,name) 
	VALUES(DEFAULT,'Maça');

SELECT * FROM frutas;

SELECT currval(pg_get_serial_sequence('frutas', 'id'));

INSERT INTO frutas(name) 
	VALUES('Banana')
	RETURNING id;

CREATE TABLE teams2 (
	id SERIAL UNIQUE,
	name VARCHAR(90)
	);

ALTER SEQUENCE teams2_id_seq RESTART WITH 3 INCREMENT BY 3;

INSERT INTO teams2 (name) VALUES ('Crystal Palace'); 
INSERT INTO teams2 (name) VALUES ('Leeds United');

SELECT * FROM teams2;

INSERT INTO teams2 (name) VALUES ('Manchester United');

SELECT LASTVAL();

INSERT INTO teams2 (name) VALUES ('Chelsea');

SELECT CURRVAL('teams2_id_seq');

INSERT INTO teams2 (name) VALUES ('Arsenal') RETURNING id;

INSERT INTO teams2 VALUES (8, 'Everton');

SELECT * FROM teams2;

INSERT INTO teams2 (name) VALUES ('Liverpool');  

SELECT * FROM teams2;

INSERT INTO teams2 (name) VALUES ('Some team');  

INSERT INTO teams2 (name) VALUES ('Newcastle United');

SELECT * FROM teams2;

ALTER SEQUENCE teams2_id_seq RESTART WITH 31;

INSERT INTO teams2 (name) VALUES ('Queens Park Rangers');

INSERT INTO teams2 (name) VALUES ('Queens Park Rangers2');

SELECT * FROM teams2;

Links de ref:
https://www.postgresql.org/docs/current/datatype-numeric.html#DATATYPE-SERIAL