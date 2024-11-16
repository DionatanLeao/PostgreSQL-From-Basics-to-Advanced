CREATE RECURSIVE VIEW view_nome(colunas) AS
	SELECT colunas;

CREATE VIEW view_nome AS
  WITH RECURSIVE cte_nome (colunas) AS (
    SELECT ...)
  SELECT colunas FROM cte_nome;

CREATE TABLE funcionarios (
	funcionario_id serial PRIMARY KEY,
	nome_completo VARCHAR NOT NULL,
	cargo_id INT
);

INSERT INTO funcionarios (
	funcionario_id,
	nome_completo,
	cargo_id
)
VALUES (1, 'Michael North', NULL),
	(2, 'Megan Berry', 1),
	(3, 'Sarah Berry', 1),
	(4, 'Zoe Black', 1),
	(5, 'Tim James', 1),
	(6, 'Bella Tucker', 2),
	(7, 'Ryan Metcalfe', 2),
	(8, 'Max Mills', 2),
	(9, 'Benjamin Glover', 2),
	(10, 'Carolyn Henderson', 3),
	(11, 'Nicola Kelly', 3),
	(12, 'Alexandra Climo', 3),
	(13, 'Dominic King', 3),
	(14, 'Leonard Gray', 4),
	(15, 'Eric Rampling', 4),
	(16, 'Piers Paige', 7),
	(17, 'Ryan Henderson', 7),
	(18, 'Frank Tucker', 8),
	(19, 'Nathan Ferguson', 8),
	(20, 'Kevin Rampling', 8);

WITH RECURSIVE reporting_line AS (
	SELECT
		funcionario_id,
		nome_completo AS subordinados
	FROM
		funcionarios
	WHERE
		cargo_id IS NULL
	UNION ALL
		SELECT
			e.funcionario_id,
			(
				rl.subordinados || ' > ' || e.nome_completo
			) AS subordinados
		FROM
			funcionarios e
		INNER JOIN reporting_line rl ON e.cargo_id = rl.funcionario_id
) SELECT
	funcionario_id,
	subordinados
FROM
	reporting_line
ORDER BY
	funcionario_id;

CREATE RECURSIVE VIEW reporting_line (funcionario_id, subordinados) AS 
SELECT
	funcionario_id,
	nome_completo AS subordinados
FROM
	funcionarios
WHERE
	cargo_id IS NULL
UNION ALL
	SELECT
		e.funcionario_id,
		(
			rl.subordinados || ' > ' || e.nome_completo
		) AS subordinados
	FROM
		funcionarios e
	INNER JOIN reporting_line rl ON e.cargo_id = rl.funcionario_id;

SELECT subordinados FROM reporting_line WHERE funcionario_id = 10;