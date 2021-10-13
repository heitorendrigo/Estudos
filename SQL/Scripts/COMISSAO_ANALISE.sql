select rep.agn_in_codigo as COD_REP,
       REP.AGN_ST_NOME AS NOME_REP,
       TAB_COM.TCO_ST_DESCRICAO as COM_REP,
       itn_ped_nf.pe_ped_in_codigo as PEDIDO,
       nf.not_in_numero as NFe,
       agn.agn_in_codigo as COD_AGN,
       agn.agn_st_nome as AGN_NOME,
       repnf.rnf_re_basecomissao as TOT_BASE_COM,
       repnf.rnf_re_valorcomissao as TOT_VL_COM,
       repnf.Rnf_Re_Perccomissao AS TOT_PERC_COM,
       itnf.itn_in_sequencia as SEQ,
       pro.pro_in_codigo as COD_PROD,
       PRO.PRO_ST_DESCRICAO AS NOME_PROD,    
       repitnf.rin_re_basecomissao as BASE_COM_ITN,
       repitnf.rin_re_perccomissao AS PERC_COM_ITN,
       repitnf.rin_re_valorcomissao AS VL_COM_ITN,
       repitnf.rin_re_valorcomissaocalc AS VL_COM_ITN_CALC,
       repitnf.rin_re_perccomissaocalc  AS PERC_COM_ITNCALC
       
       
  from mgven.ven_notafiscal nf,
       mgven.ven_itemnotafiscal itnf,
       mgglo.glo_agentes agn,
       mgadm.est_produtos pro,
       mgven.ven_representantenf repnf,
       mgven.ven_representanteitemnf repitnf,
       mgglo.glo_agentes rep,
       mgven.VEN_ITEMPEDI_VEN_ITEMNOT itn_ped_nf,
       mgglo.glo_representante rep_com,
       mgglo.glo_tipocomissao TAB_COM
       
where nf.not_in_codigo = itnf.not_in_codigo
  and itn_ped_nf.nf_itn_in_sequencia = itnf.itn_in_sequencia
  and nf.agn_in_codigo = agn.agn_in_codigo
  and nf.rep_in_codigo = rep.agn_in_codigo
  and itnf.pro_in_codigo = pro.pro_in_codigo   (+)
  and repnf.not_in_codigo = nf.not_in_codigo  
  and repitnf.not_in_codigo = itnf.not_in_codigo    (+)
  and repitnf.itn_in_sequencia = itnf.itn_in_sequencia   (+)
  and itn_ped_nf.nf_not_in_codigo = nf.not_in_codigo (+)
  and rep_com.agn_in_codigo = rep.agn_in_codigo
  AND REP_COM.TCO_IN_CODIGO = TAB_COM.TCO_IN_CODIGO

and nf.not_in_numero in (115591)   -- NF
--and nf.rep_in_codigo = 23482 --REPRESENTANTE
--and nf.not_dt_emissao >= '01-05-2020' -- PERIODO INICIAL
--and agn.agn_st_nome like ('%ATACA%') NOME CLIENTE 

