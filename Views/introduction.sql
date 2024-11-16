Fonte:
https://www.postgresqltutorial.com/postgresql-views/
https://www.postgresqltutorial.com/managing-postgresql-views/
https://www.postgresql.org/docs/current/tutorial-views.html
https://www.postgresql.org/docs/current/sql-alterview.html

CREATE DATABASE dvdrental;

SELECT cu.customer_id AS id,
    cu.first_name || ' ' || cu.last_name AS nome,
    a.address AS "endereco",
    a.postal_code AS "cod postal",
    a.phone AS "tel",
    city.city AS "cidade",
    country.country AS "pais",
        CASE
            WHEN cu.activebool THEN 'ativo'
            ELSE ''
        END AS notes,
    cu.store_id AS sid
   FROM customer cu
     INNER JOIN address a USING (address_id)
     INNER JOIN city USING (city_id)
     INNER JOIN country USING (country_id);

CREATE VIEW cliente_master AS
  SELECT cs.customer_id AS id,
    cs.first_name || ' ' || cs.last_name AS name,
    a.address,
    a.postal_code AS "zip code",
    a.phone,
    city.city,
    country.country,
        CASE
            WHEN cs.activebool THEN 'active'
            ELSE ''
        END AS notes,
    cu.store_id AS sid
   FROM customer cs
     INNER JOIN address a USING (address_id)
     INNER JOIN city USING (city_id)
     INNER JOIN country USING (country_id);

SELECT * FROM cliente_master;

CREATE OR REPLACE view_nome AS query;

CREATE VIEW cliente_master2 AS 
    SELECT cs.customer_id AS id,
        cs.first_name || ' ' || cs.last_name AS nome,
        a.address AS "endereco",
        a.postal_code AS "cod postal",
        a.phone AS "tel",
        city.city AS "cidade",
        country.country AS "pais",
            CASE
                WHEN cs.activebool THEN 'ativo'
                ELSE ''
            END AS notes,
        cs.store_id AS sid,
        cs.email
    FROM customer cs
        INNER JOIN address a USING (address_id)
        INNER JOIN city USING (city_id)
        INNER JOIN country USING (country_id);

SELECT * FROM cliente_master2;
ALTER VIEW cliente_master2 RENAME TO cliente_master1;
DROP VIEW IF EXISTS cliente_master1;