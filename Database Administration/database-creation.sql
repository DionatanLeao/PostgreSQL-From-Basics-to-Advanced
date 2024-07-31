sudo su - postgres

\list

\l

CREATE DATABASE meubd;

DROP DATABASE meubd;

CREATE DATABASE meubd TEMPLATE meu_template_db;

UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'meubd';

UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'meubd';