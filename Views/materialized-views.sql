https://www.postgresql.org/docs/current/rules-materializedviews.html

CREATE MATERIALIZED VIEW alugel_por_categoria AS
 SELECT c.name AS category,
    sum(p.amount) AS vendas_total
   FROM (((((payment p
     JOIN rental r ON ((p.rental_id = r.rental_id)))
     JOIN inventory i ON ((r.inventory_id = i.inventory_id)))
     JOIN film f ON ((i.film_id = f.film_id)))
     JOIN film_category fc ON ((f.film_id = fc.film_id)))
     JOIN category c ON ((fc.category_id = c.category_id)))
  GROUP BY c.name
  ORDER BY sum(p.amount) DESC
WITH NO DATA;

SELECT * FROM alugel_por_categoria;
REFRESH MATERIALIZED VIEW alugel_por_categoria;
SELECT * FROM alugel_por_categoria;
CREATE UNIQUE INDEX rental_category ON alugel_por_categoria (category);
REFRESH MATERIALIZED VIEW CONCURRENTLY alugel_por_categoria;
SELECT * FROM alugel_por_categoria;