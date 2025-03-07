CREATE OR REPLACE PROCEDURE PRC_DEL_NOME_TABELA
(P_NOME_PK   NOME_TABELA.NOME_PK%TYPE,
 P_COMMIT    BOOLEAN DEFAULT FALSE) IS
E_ERRO_FK_EXISTENTE       EXCEPTION;
PRAGMA EXCEPTION_INIT(E_ERRO_FK_EXISTENTE ,-2292);
BEGIN
    DELETE FROM NOME_TABELA
     WHERE NOME_PK = P_NOME_PK;
    IF P_COMMIT AND SQL%ROWCOUNT > 0 THEN
       COMMIT;
    END IF;


EXCEPTION
    WHEN  E_ERRO_FK_EXISTENTE THEN
      DBMS_OUTPUT.PUT_LINE('Existem valores realacionados - Exclusao nao realizada');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Erro de exclusao na tabela NOME_TABELA');
END;

--CRIACAO BLOCO ANONIMO PARA CHAMADA DA PROCEDURE
SET SERVEROUTPUT ON;
BEGIN
   PRC_DEL_NOME_TABELA('&VALOR_NOME_PK'); --SE NAO QUISER SALVAR
   PRC_DEL_NOME_TABELA('&VALOR_NOME_PK',TRUE); --SE QUISER SALVAR
   --COMMIT; --SALVA 
EXCEPTION
   WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE('Erro na execu��o da rotina PRC_DEL_NOME_TABELA');
END;

   

  
