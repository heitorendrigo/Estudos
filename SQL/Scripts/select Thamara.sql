select 
nf.rep_in_codigo as COD_REPRE, 
rep.agn_st_nome as NOME_REPRE, 
nf.agn_in_codigo AS COD_CLIENTE, 
agn.agn_st_nome AS NOME_CLIENTE, 
nf.not_in_numero AS NUMERO_NOTA, 
itnf.pro_in_codigo AS COD_MEGA, 
pro.pro_st_descricao AS PRODUTO, 
itnf.itn_re_quantidade AS QTD, 
itnf.uni_st_unidade AS UNIDADE, 
nf.not_dt_emissao DATA_VENDA

from mgven.ven_notafiscal nf, mgven.ven_itemnotafiscal itnf, mgglo.glo_agentes agn, mgglo.glo_agentes rep, mgadm.est_produtos pro
where nf.not_in_codigo = itnf.not_in_codigo
and  nf.agn_in_codigo = agn.agn_in_codigo
and nf.rep_in_codigo = rep.agn_in_codigo
and itnf.pro_in_codigo = pro.pro_in_codigo
and nf.tpd_in_codigo in (10,11,12)
and nf.not_dt_emissao > '01-jan-2010'
and nf.rep_in_codigo in (25534,26688,25533,25754,25616)





