INSERT INTO AREA (DEPTNUM, NOME, CIDADE) VALUES (50, 'TI', 'CIDADE2');

CREATE TABLE D (id INTEGER DEFAULT 0);

INSERT INTO D VALUES (DEFAULT);

INSERT INTO D (id) VALUES (DEFAULT);

CREATE TABLE A (id INTEGER DEFAULT 0, coluna2 VARCHAR(10));

INSERT INTO A (coluna2) VALUES ('Teste');

INSERT INTO A (id, coluna2) VALUES (20, 'Teste');

CREATE TABLE A (id INTEGER DEFAULT 0, teste VARCHAR(10));

INSERT INTO A (id,teste) VALUES (null, 'teste');

INSERT INTO A (teste) VALUES ('teste');

CREATE TABLE AREA2 (DEPTNUM INTEGER, NOME VARCHAR(20), CIDADE VARCHAR(20));

INSERT INTO AREA2 (DEPTNUM, NOME, CIDADE) SELECT DEPTNUM, NOME, CIDADE FROM AREA
    WHERE CIDADE IN ('GUARULHOS', 'OSASCO');

INSERT INTO AREA2 (DEPTNUM, NOME, CIDADE) SELECT DEPTNUM, NOME, CIDADE FROM AREA;