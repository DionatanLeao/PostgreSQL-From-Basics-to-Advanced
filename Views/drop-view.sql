https://www.postgresql.org/docs/current/sql-dropview.html

CREATE VIEW film_master AS
SELECT 
        film_id, 
        title, 
        release_year, 
        length, 
        name category
    FROM 
        film
    INNER JOIN film_category 
        USING (film_id)
    INNER JOIN category 
        USING(category_id);

CREATE VIEW horror_film AS
    SELECT 
        film_id, 
        title, 
        release_year, 
        length 
    FROM 
        film_master
    WHERE 
        category = 'Horror';

CREATE VIEW comedy_film AS
    SELECT 
        film_id, 
        title, 
        release_year, 
        length 
    FROM 
        film_master
    WHERE 
        category = 'Comedy';

CREATE VIEW film_category_stat AS
    SELECT 
        name, 
        COUNT(film_id) 
    FROM category
    INNER JOIN film_category USING (category_id)
    INNER JOIN film USING (film_id)
    GROUP BY name;

CREATE VIEW film_length_stat AS
    SELECT 
        name, 
        SUM(length) film_length
    FROM category
    INNER JOIN film_category USING (category_id)
    INNER JOIN film USING (film_id)
    GROUP BY name;

SELECT * FROM horror_film;
SELECT * FROM comedy_film;
SELECT * FROM film_length_stat;
DROP VIEW comedy_film;
DROP VIEW film_master;
DROP VIEW film_master CASCADE;
DROP VIEW film_length_stat, film_category_stat;