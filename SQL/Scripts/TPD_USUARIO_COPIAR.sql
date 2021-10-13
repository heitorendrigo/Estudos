Declare
   vQtd_registros number := 0;                                        -- DECLARA VARIAVEL DE CONTADOR PARA CONFERENCIA NO FINAL DO PROCEDIMENTO CONFERIR O NUMERO DE REG.
      Cursor CURSOR_TIPO_DOC_USUARIO IS
      select P.* from MGVEN.VEN_USUTIPODOC P
      WHERE P.USU_IN_CODIGO = 56;                                      -- SELECIONA OS REGISTRO DO USUARIO DE REFERENCIA, 
                                                                      --O QUAL QUERO COPIAR AS LIBERA합ES      

Begin
      For Update_mov in CURSOR_TIPO_DOC_USUARIO

          Loop                                                              -- INICIO DE LOOP
      
            insert into MGVEN.VEN_USUTIPODOC C
            (
            tpd_tab_in_codigo,
            tpd_pad_in_codigo,
            tpd_in_codigo,                                            --CAMPOS DA TABELA (COMPOSI플O DO INSERTE)
            tdu_bo_aprovador, 
            usu_in_codigo
            )
         VALUES            
            (
                        
            p.tpd_tab_in_codigo ,                -- ATRIBUI AO CAMPO AS INFORMA합ES ENCONTRADAS NO SELECT ACIMA
            p.tpd_pad_in_codigo,
            p.tpd_in_codigo,
            ,
            130                                   -- USUARIO QUE RECEBERA AS LIBERA합ES
            );
            
            
            vQtd_registros := vQtd_registros + sql%rowcount;           -- INCREMENTA A VARIAVEL DE CONTAGEM SOMANDO O INDECE DA ROW NA PROPRIA VARIAVEL      
       End Loop;                                                        -- ENCERRA LOOP
      
  dbms_output.put_line('Registros deletados : ' || vQtd_registros);    -- EXIBE VARIAVEL DE CONTADOR PARA CONFERENCIA NO FINAL DO PROCEDIMENTO CONFERIR O NUMERO DE REG.
End;
