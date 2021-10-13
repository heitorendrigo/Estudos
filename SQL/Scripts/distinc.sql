select distinct r.rcb_st_nota from mgadm.est_itensreceb i,  mgadm.est_recebimento r, mgtrf.trf_movdocfis_e t 

where r.rcb_st_nota = t.mde_st_ndocini
and r.agn_in_codigo = i.agn_in_codigo
and r.rcb_st_nota = i.rcb_st_nota
and r.rcb_st_nota = i.rcb_st_nota
and r.rcb_dt_documento > '01-nov-2013'
and i.apl_in_codigo = 2
and r.rcb_re_totalfrete <> '0,00'
and t.mde_re_frete = '0,00'
