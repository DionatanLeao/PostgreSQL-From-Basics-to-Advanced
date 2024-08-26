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