Declare
   vQtd_registros number := 0;                                        -- DECLARA VARIAVEL DE CONTADOR PARA CONFERENCIA NO FINAL DO PROCEDIMENTO CONFERIR O NUMERO DE REG.
      Cursor CURSOR_TIPO_DOC_GRUPO IS
      select P.* from MGVEN.VEN_TIPODOCGRUPOESTOQUE P
      WHERE P.TPD_IN_CODIGO = &TPD_ORIGEM;   -- SELECIONA OS REGISTRO DO USUARIO DE REFERENCIA, 
                                                                      --O QUAL QUERO COPIAR AS LIBERAÇÕES      

Begin
      For Update_mov in CURSOR_TIPO_DOC_GRUPO

          Loop                                                              -- INICIO DE LOOP
      
            insert into MGVEN.VEN_TIPODOCGRUPOESTOQUE C
            (
            TPD_TAB_IN_CODIGO,
            TPD_PAD_IN_CODIGO,
            TPD_IN_CODIGO,
            TDG_IN_SEQUENCIA,
            GRU_TAB_IN_CODIGO,       --CAMPOS DA TABELA (COMPOSIÇÃO DO INSERTE)
            GRU_PAD_IN_CODIGO,
            GRU_IDE_ST_CODIGO,
            GRU_IN_CODIGO
            
            
             )
         VALUES            
            (
              P.TPD_TAB_IN_CODIGO,
              P.TPD_PAD_IN_CODIGO,
              ??????,                -- ****INSERIR COD TIPO DE DOC DE DESTINO********
              P.TDG_IN_SEQUENCIA,
              P.GRU_TAB_IN_CODIGO,
              P.GRU_PAD_IN_CODIGO,
              P.GRU_IDE_ST_CODIGO,
              P.GRU_IN_CODIGO                                  -- USUARIO QUE RECEBERA AS LIBERAÇÕES
            );
            
            
            vQtd_registros := vQtd_registros + sql%rowcount;           -- INCREMENTA A VARIAVEL DE CONTAGEM SOMANDO O INDECE DA ROW NA PROPRIA VARIAVEL      
       End Loop;                                                        -- ENCERRA LOOP
      
  dbms_output.put_line('Registros deletados : ' || vQtd_registros);    -- EXIBE VARIAVEL DE CONTADOR PARA CONFERENCIA NO FINAL DO PROCEDIMENTO CONFERIR O NUMERO DE REG.
End;
