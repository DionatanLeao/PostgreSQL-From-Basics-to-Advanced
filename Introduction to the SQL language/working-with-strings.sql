SELECT substr(
    e.NOME,iter.POSICAO,1) 
    AS C FROM 
    (SELECT NOME FROM FUN WHERE NOME = 'JAMES') e, 
    (SELECT ID AS POSICAO FROM TABELA10) iter WHERE iter.POSICAO <= length(e.NOME)

SELECT NOME,iter.POSICAO FROM 
    (SELECT NOME FROM FUN WHERE NOME = 'JAMES') e, (SELECT ID AS POSICAO FROM TABELA10) iter

SELECT NOME,iter.POSICAO FROM 
    (SELECT NOME FROM FUN WHERE NOME = 'JAMES') e, 
    (SELECT ID AS POSICAO FROM TABELA10) iter WHERE iter.POSICAO <= length(e.NOME)

SELECT (length('TESTE1, TESTE2, TESTE3') 
            - length(replace('TESTE1, TESTE2, TESTE3',',',''))) 
            / length(',') AS Vírgula FROM TABELA1

SELECT (length('TESTE1, TESTE2, TESTE3') 
            - length(replace('TESTE1, TESTE2, TESTE3',',',''))) 
            / length(',') AS Vírgula FROM TABELA1

SELECT NOME, replace( 
                    replace( 
                        replace( 
                            replace( 
                                replace('A', ''), 
                                            'E', ''), 
                                                'I', ''), 
                                                    'O', ''), 
                                                        'U', '') AS resultado1,
        SALARIO, replace(SALARIO,0,'') resultado2 FROM FUN

SELECT NOME FROM FUN ORDER BY substr(NOME, length(NOME)-1)

SELECT DEPTNUM, group_concat(NOME ORDER BY FUNNUM separator ',') AS Colaborador
    FROM FUN  GROUP BY DEPTNUM