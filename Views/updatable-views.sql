https://www.postgresql.org/docs/13/sql-createview.html

CREATE VIEW eua_cidades AS SELECT
	city,
	country_id
FROM
	city
WHERE
	country_id = 103;

SELECT * FROM eua_cidades;

INSERT INTO eua_cidades (city, country_id)
	VALUES('San Jose', 103);

SELECT
	city,
	country_id
FROM
	city
WHERE
	country_id = 103
ORDER BY
	last_update DESC;

DELETE
FROM
	eua_cidades
WHERE city = 'San Jose';

SELECT * FROM eua_cidades;

CREATE VIEW eua_cidade AS SELECT
	city_id,
	city,
	country_id
FROM
	city
WHERE
	country_id = 103
ORDER BY
	city;

INSERT INTO eua_cidade (city, country_id)
	VALUES ('Birmingham', 102);

INSERT INTO eua_cidade (city, country_id)
	VALUES ('Cambridge', 102);

CREATE OR REPLACE VIEW eua_cidade AS SELECT
	city_id,
	city,
	country_id
FROM
	city
WHERE
	country_id = 103
ORDER BY
	city WITH CHECK OPTION;

INSERT INTO eua_cidade (city, country_id)
	VALUES ('Birmingham', 102);

INSERT INTO eua_cidade (city, country_id)
	VALUES ('Cambridge', 102);

UPDATE eua_cidade
SET country_id = 102
WHERE
	city_id = 135;

CREATE VIEW cidade_a AS SELECT
	city_id,
	city,
	country_id
FROM
	city
WHERE
	city LIKE 'A%';

CREATE OR REPLACE VIEW cidade_a_usa AS SELECT
	city_id,
	city,
	country_id
FROM
	cidade_a
WHERE country_id = 103 
WITH CASCADED CHECK OPTION;

INSERT INTO cidade_a_usa (city, country_id)
	VALUES ('Houston', 103);

CREATE OR REPLACE VIEW cidade_a_usa AS SELECT
	city_id,
	city,
	country_id
FROM
	cidade_a
WHERE country_id = 103 
WITH LOCAL CHECK OPTION;

INSERT INTO cidade_a_usa (city, country_id)
	VALUES ('Houston', 103);

SELECT * FROM cidade_a_usa;