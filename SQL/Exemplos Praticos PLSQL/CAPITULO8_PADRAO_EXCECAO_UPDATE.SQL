SET SERVEROUTPUT ON;
DECLARE
V_NOME_TABELA   NOME_TABELA%ROWTYPE;
E_ERRO_FK       EXCEPTION;
PRAGMA EXCEPTION_INIT(E_ERRO_FK ,-2292);
BEGIN
    SELECT * 
      INTO V_NOME_TABELA
      FROM NOME_TABELA
      --WHERE 
      ;

    UPDATE NOME_TABELA
      SET ROW = V_NOME_TABELA
     WHERE NOME_PK = V_NOME_TABELA.NOME_PK;
    IF SQL%ROWCOUNT > 0 THEN
       COMMIT;
    END IF;


EXCEPTION
    WHEN  E_ERRO_FK THEN
      DBMS_OUTPUT.PUT_LINE('Erro de valor em coluna relacionada');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro de update na tabela NOME_TABELA');
END;  
