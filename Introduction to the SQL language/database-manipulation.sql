INSERT INTO AREA (DEPTNUM, NOME, CIDADE) VALUES (50, 'TI', 'CIDADE2');

CREATE TABLE D (id INTEGER DEFAULT 0);

INSERT INTO D VALUES (DEFAULT);

INSERT INTO D (id) VALUES (DEFAULT);

CREATE TABLE A (id INTEGER DEFAULT 0, coluna2 VARCHAR(10));

INSERT INTO A (coluna2) VALUES ('Teste');

INSERT INTO A (id, coluna2) VALUES (20, 'Teste');