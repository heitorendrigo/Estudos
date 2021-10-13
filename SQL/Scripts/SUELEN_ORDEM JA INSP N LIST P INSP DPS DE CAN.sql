--situação: suelen errou nos valores de inspeção, e pede para o PCP cancelar a ordem e reabrir na sequencia, porem a inspeção continua nao
-- aparecendo para a suelen.

select p.*,p.rowid from MGADM.EST_ITENSINSPECAO p 
where p.ins_in_sequencia = XXXXXXXX -- NUEMRO DA INSPEÇÃO

--P.INS_CH_INSPECIONADO = 'N'  virar para 'S' para aparecer na listagem de inspeção 1ª ETAPA DA SUELEN
--P.LIN_CH_STATUS SETAR = 'I'  SETAR COMO 'L' PARA APARECER NA LISTAGEM DE LAUDO FINAL 2ª 





