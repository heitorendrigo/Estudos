SELECT distinct(nf.agn_in_codigo)
FROM MGVEN.VEN_NOTAFISCAL NF, mgglo.glo_agentes agn, mgglo.glo_agentes_id id

WHERE  nf.agn_in_codigo = agn.agn_in_codigo
and agn.agn_in_codigo = id.agn_in_codigo

and nf.not_dt_emissao in (select max(p.not_dt_emissao) from mgven.ven_notafiscal p where p.agn_in_codigo = nf.agn_in_codigo)
and nf.not_dt_emissao < '01-jan-2015'
and nf.tpd_in_codigo in (10,11,12)                               
and id.agn_tau_st_codigo = 'C'
and id.agn_ch_status = 'A'



