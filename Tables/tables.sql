PostgreSQL possui três tipos de tabelas:
- Tabelas temporárias
- Tabelas não-registradas
- Tabelas registradas

https://www.postgresql.org/docs/current/sql-createtable.html

create database forumdb2;
\c forumdb2
CREATE TABLE logs (
	id serial PRIMARY KEY,
	usuario varchar(50), 
	descricao text, 
	log_ts timestamp with time zone NOT NULL DEFAULT
	current_timestamp
);

CREATE SCHEMA meu_esquema;
CREATE TABLE meu_esquema.logs (
	id serial PRIMARY KEY,
	usuario varchar(50),
	descricao text,
	log_ts timestamp with time zone NOT NULL DEFAULT 
	current_timestamp
);

\d meu_esquema.logs

CREATE TABLE users (
	pk int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL, 
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( pk ),
	UNIQUE ( username )
);

\d users