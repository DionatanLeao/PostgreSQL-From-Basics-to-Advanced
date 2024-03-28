SELECT DEPTNUM FROM FUN;

SELECT DEPTNUM FROM AREA;

SELECT DEPTNUM FROM AREA WHERE DEPTNUM NOT IN (SELECT DEPTNUM FROM FUN);

SELECT DISTINCT DEPTNUM FROM AREA WHERE DEPTNUM NOT IN (SELECT DEPTNUM FROM FUN);

SELECT f.NOME, a.CIDADE FROM FUN f, AREA a WHERE f.DEPTNUM = 10;

SELECT f.NOME, a.CIDADE FROM FUN f, AREA a WHERE f.DEPTNUM = 10 AND a.DEPTNUM = f.DEPTNUM;

SELECT NOME, COMISSAO FROM FUN WHERE COALESCE(COMISSAO, 0) < (SELECT COMISSAO FROM FUN WHERE NOME = 'WALDIR');

SELECT NOME, COMISSAO, COALESCE(COMISSAO, 0) FROM FUN WHERE COALESCE(COMISSAO, 0) < (SELECT COMISSAO FROM FUN WHERE NOME = 'WALDIR');