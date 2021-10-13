select ir.*,ir.rowid from   mgadm.est_itensreceb ir,mgadm.est_lotesinspecao  l  
where ir.pro_in_codigo=4319
and   L.INS_IN_SEQUENCIA = IR.INS_IN_SEQUENCIA
and l.lin_st_loteforne='31243'

--61770  INS_IN_SEQUENCIA mgadm.est_itensreceb
 
