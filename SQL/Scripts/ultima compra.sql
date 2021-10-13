select 
itn.rcb_st_nota,
itn.agn_in_codigo, 
agn.agn_st_fantasia,
itn.pro_in_codigo,
prod.pro_st_descricao,
itn.rcb_dt_documento

  from mgadm.est_itensreceb itn,
       mgglo.glo_agentes agn,
        mgglo.glo_fornecedor forn,
        mgadm.est_produtos prod
        
 where  itn.agn_tab_in_codigo = agn.agn_tab_in_codigo
    and itn.agn_pad_in_codigo = agn.agn_pad_in_codigo
    and     itn.agn_in_codigo = agn.agn_in_codigo
    and    forn.agn_in_codigo = agn.agn_in_codigo
    and    prod.pro_in_codigo = itn.pro_in_codigo
    
    and itn.rcb_dt_documento = ( select  max(p.rcb_dt_documento) from mgadm.est_itensreceb p 
                                                                      where p.pro_in_codigo = itn.pro_in_codigo)
      

