--situa��o: suelen errou nos valores de inspe��o, e pede para o PCP cancelar a ordem e reabrir na sequencia, porem a inspe��o continua nao
-- aparecendo para a suelen.

select p.*,p.rowid from MGADM.EST_ITENSINSPECAO p 
where p.ins_in_sequencia = XXXXXXXX -- NUEMRO DA INSPE��O

--P.INS_CH_INSPECIONADO = 'N'  virar para 'S' para aparecer na listagem de inspe��o 1� ETAPA DA SUELEN
--P.LIN_CH_STATUS SETAR = 'I'  SETAR COMO 'L' PARA APARECER NA LISTAGEM DE LAUDO FINAL 2� 





