https://www.postgresql.org/docs/current/sql-createsequence.html

CREATE SEQUENCE minhasequencia INCREMENT 5 START 100;
SELECT nextval('minhasequencia');
SELECT nextval('minhasequencia');
CREATE SEQUENCE tres 
	INCREMENT -1 
	MINVALUE 1 
	MAXVALUE 3 
	START 3 
	CYCLE;

SELECT nextval('tres');
CREATE TABLE detalhes_pedido(
    pedido_id SERIAL,
    item_id INT NOT NULL,
    item_texto VARCHAR NOT NULL,
    preco DEC(10,2) NOT NULL,
    PRIMARY KEY(pedido_id, item_id)
);

CREATE SEQUENCE pedido_item_id
	START 10
	INCREMENT 10
	MINVALUE 10
	OWNED BY detalhes_pedido.item_id;

INSERT INTO detalhes_pedido(pedido_id, item_id, item_texto, preco)
	VALUES
    (100, nextval('pedido_item_id'),'DVD Player',100),
    (100, nextval('pedido_item_id'),'Android TV',550),
    (100, nextval('pedido_item_id'),'Speaker',250);

SELECT
    pedido_id,
    item_id,
    item_texto,
    preco
FROM
    detalhes_pedido;     

SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';

DROP TABLE detalhes_pedido;