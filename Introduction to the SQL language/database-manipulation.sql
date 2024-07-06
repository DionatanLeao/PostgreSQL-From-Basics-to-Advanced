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

SELECT DEPTNUM,NOME,SALARIO FROM FUN;

SELECT DEPTNUM,NOME,SALARIO FROM FUN WHERE DEPTNUM = 20 ORDER BY 1,3;

UPDATE FUN SET SALARIO = SALARIO*1.20 WHERE DEPTNUM=20;

SELECT DEPTNUM,NOME,SALARIO 
    AS SALARIO_INICIAL, SALARIO*.10 
        AS VALOR_SOMADO, SALARIO*1.10
            AS SALARIO_REAJUSTADO FROM FUN WHERE DEPTNUM=20;

CREATE TABLE FUN_2 AS SELECT * FROM FUN;

UPDATE FUN SET SALARIO=SALARIO*1.30 WHERE FUNNUM IN (SELECT FUNNUM FROM FUN_2)

UPDATE FUN SET SALARIO = SALARIO*1.30 WHERE 
    EXISTS (SELECT NULL FROM FUN_2 WHERE FUN.FUNNUM=FUN_2.FUNNUM)