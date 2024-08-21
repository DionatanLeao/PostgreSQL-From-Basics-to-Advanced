https://www.postgresql.org/docs/current/manage-ag-tablespaces.html

CREATE TABLESPACE secondary LOCATION '/var/lib/postgresql/13/';
CREATE TABLESPACE secondary LOCATION 'C:/pgdata13_secondary';
ALTER DATABASE meudb_admin SET TABLESPACE secondary;
ALTER TABLE tabela1 SET TABLESPACE secondary;