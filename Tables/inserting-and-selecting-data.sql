CREATE TABLE users (
	id int GENERATED ALWAYS AS IDENTITY,
	username text NOT NULL, 
	gecos text,
	email text NOT NULL,
	PRIMARY KEY( id ),
	UNIQUE ( username )
);

insert into users (username,gecos,email) values ('meuusername','meugecos','meuemail');
select * from users;

select id, username, gecos, email from users;

insert into users (username,gecos,email) values ('vitor','vitor_gecos','vitor_email');
select id,username,gecos,email from users order by username;
select id,username,gecos,email from users order by 2;

CREATE TABLE categories (
	id int GENERATED ALWAYS AS IDENTITY,
	title text, 
	description text,
	PRIMARY KEY( id )
);

insert into categories (title,description) values ('maça', 'frutas'), ('laranja','frutas'),('alface','vegetal');
select * from categories;
select * from categories where description ='vegetal';
select * from categories where description ='frutas' and title='laranja';
select * from categories where description ='frutas' order by title desc;
select * from categories where description ='frutas' order by 2 desc;