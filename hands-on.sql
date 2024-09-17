CREATE TABLE logs (
	id serial PRIMARY KEY,
	usuario varchar(50), 
	descricao text, 
	log_ts timestamp with time zone NOT NULL DEFAULT
	current_timestamp
);

SELECT * FROM logs;

CREATE SCHEMA meu_esquema;

CREATE TABLE meu_esquema.logs (
	id serial PRIMARY KEY,
	usuario varchar(50),
	descricao text,
	log_ts timestamp with time zone NOT NULL DEFAULT 
	current_timestamp
);

SELECT * FROM meu_esquema.logs;

CREATE TABLE users (
	pk int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL, 
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( pk ),
	UNIQUE ( username )
);

SELECT * FROM users;

CREATE TABLE IF NOT EXISTS users (
	pk int GENERATED ALWAYS AS IDENTITY
	,username text NOT NULL
	,gecos text
	,email text NOT NULL
	,PRIMARY KEY( pk )
	,UNIQUE ( username )
);

DROP TABLE IF EXISTS users;

CREATE TEMP TABLE IF NOT EXISTS temp_users (
	pk int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL,
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( pk ),
	UNIQUE ( username )
);

DROP TABLE temp_users;

BEGIN work;

SELECT * FROM temp_users;

COMMIT work;

CREATE UNLOGGED TABLE if not exists unlogged_users (
	pk int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL,
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( pk ),
	UNIQUE ( username )
);

SELECT * FROM unlogged_users;

CREATE TYPE usuario_basico AS (
	usuario varchar(50), 
	pwd varchar(10)
);

SELECT * FROM usuario_basico;

CREATE TABLE super_usuario OF usuario_basico (
	CONSTRAINT pk_su PRIMARY KEY (usuario)
);

ALTER TYPE usuario_basico ADD ATTRIBUTE telefone varchar(10) CASCADE;

CREATE TABLE users (
	id int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL, 
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( id ),
	UNIQUE ( username )
);

INSERT INTO users (username,gecos,email) VALUES ('meuusername','meugecos','meuemail');

SELECT * FROM users;

INSERT INTO users (username,gecos,email) VALUES ('vitor','vitor_gecos','vitor_email');

CREATE TABLE categories (
	id int GENERATED ALWAYS AS IDENTITY,
	title text, 
	description text,
	PRIMARY KEY( id )
);

INSERT INTO categories (title,description) VALUES ('maça', 'frutas'), ('laranja','frutas'),('alface','vegetal');

SELECT * FROM categories;

INSERT INTO categories (title) VALUES ('limão');

INSERT INTO categories (title,description) VALUES ('damasco ','frutas');

CREATE TEMP TABLE temp_categories AS SELECT * FROM categories;

SELECT * FROM temp_categories;

UPDATE temp_categories SET title='pêssego' WHERE id = 4;

UPDATE temp_categories SET title = 'no title' WHERE description = 'vegetal';

SELECT * FROM temp_categories ORDER BY description;

DELETE FROM temp_categories WHERE id=1;

DELETE FROM temp_categories WHERE description IS NULL;

DELETE FROM temp_categories;

INSERT INTO temp_categories SELECT * FROM categories;

TRUNCATE TABLE temp_categories;

CREATE TABLE tabela_teste(
    id SERIAL
);

SELECT * FROM tabela_teste;

CREATE SEQUENCE table_name_id_seq;

CREATE TABLE table_name (
    id integer NOT NULL DEFAULT nextval('table_name_id_seq')
);

ALTER SEQUENCE table_name_id_seq
	OWNED BY table_name.id;

SELECT * FROM table_name_id_seq;

CREATE TABLE frutas(
   id SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL
);

SELECT * FROM frutas;

INSERT INTO frutas(name) 
	VALUES('Laranja');

INSERT INTO frutas(id,name) 
	VALUES(DEFAULT,'Maça');

SELECT currval(pg_get_serial_sequence('frutas', 'id'));

INSERT INTO frutas(name) 
	VALUES('Banana')
	RETURNING id;

CREATE TABLE teams2 (
	id SERIAL UNIQUE,
	name VARCHAR(90)
	);

ALTER SEQUENCE teams2_id_seq RESTART WITH 3 INCREMENT BY 3;

INSERT INTO teams2 (name) VALUES ('Crystal Palace'), ('Leeds United');

SELECT * FROM teams2;

INSERT INTO teams2 (name) VALUES ('Manchester United');

SELECT LASTVAL();

INSERT INTO teams2 (name) VALUES ('Chelsea');

INSERT INTO teams2 (name) VALUES ('Liverpool');  

SELECT CURRVAL('teams2_id_seq');

INSERT INTO teams2 (name) VALUES ('Arsenal') RETURNING id;

INSERT INTO teams2 VALUES (8, 'Everton');

INSERT INTO teams2 (name) VALUES ('Some team');

INSERT INTO teams2 (name) VALUES ('Newcastle United');

ALTER SEQUENCE teams2_id_seq RESTART WITH 31;

INSERT INTO teams2 (name) VALUES ('Queens Park Rangers'), ('Queens Park Rangers2');