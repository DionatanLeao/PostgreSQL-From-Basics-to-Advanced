\c forumdb2
create table if not exists users (
	pk int GENERATED ALWAYS AS IDENTITY
	,username text NOT NULL
	,gecos text
	,email text NOT NULL
	,PRIMARY KEY( pk )
	,UNIQUE ( username )
);

drop table if exists users;

create temp table if not exists temp_users (
	pk int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL,
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( pk ),
	UNIQUE ( username )
);

DROP TABLE temp_users;
begin work;

create temp table if not exists temp_users (
	pk int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL,
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( pk ),
	UNIQUE ( username )
) on commit drop;

\d temp_users;
commit work;
\d temp_users;

