CREATE UNLOGGED TABLE if not exists unlogged_users (
	pk int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL,
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( pk ),
	UNIQUE ( username )
);

\d unlogged_users;

CREATE TYPE usuario_basico AS (
	usuario varchar(50), 
	pwd varchar(10)
);

CREATE TABLE super_usuario OF usuario_basico (
	CONSTRAINT pk_su PRIMARY KEY (usuario)
);

ALTER TYPE usuario_basico ADD ATTRIBUTE telefone varchar(10) CASCADE;
\d super_usuario;