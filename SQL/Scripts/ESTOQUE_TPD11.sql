select NF.not_in_numero as NF,NF.not_dt_emissao as DATA, NF.agn_in_codigo as COD_AGENTE,
 agn.agn_st_fantasia as FANTASIA,pro.pro_in_codigo as COD_PROD, 
pro.pro_st_descricao as DESC_PROD, itnf.itn_re_quantidade as QTD, itnf.uni_st_unidade as Unidade

from mgven.ven_notafiscal NF, mgven.ven_itemnotafiscal itnf, 
mgadm.est_produtos pro, mgglo.glo_agentes agn, 
mgven.ven_itempedi_ven_itemnot pednf, mgven.ven_pedidovenda ped

where NF.agn_in_codigo = agn.agn_in_codigo
and NF.tpd_in_codigo = 11
and NF.not_dt_emissao > '01-jan-2019'
and NF.not_in_codigo = itnf.not_in_codigo

and pro.pro_in_codigo = itnf.pro_in_codigo 
and pro.pro_st_cestoque = 'S'
and pro.pro_in_codigo not in (3560, 3568, 3559, 4056, 3566,3567)

and itnf.not_in_codigo = pednf.nf_not_in_codigo

and pednf.nf_not_in_codigo = itnf.not_in_codigo
and pednf.pe_ped_in_codigo = ped.ped_in_codigo
and pednf.nf_seq_in_codigo = itnf.seq_in_codigo
and ped.tpd_in_codigo = 5
group by  NF.not_in_numero ,NF.not_dt_emissao , NF.agn_in_codigo,
 agn.agn_st_fantasia,pro.pro_in_codigo, 
pro.pro_st_descricao, itnf.itn_re_quantidade,itnf.uni_st_unidade
Order by NF
