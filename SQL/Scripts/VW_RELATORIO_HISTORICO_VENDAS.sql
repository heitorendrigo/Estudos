
create or replace view cli_vw_faturamento as
select
        nf.rep_in_codigo  as COD_REP,
        REP.AGN_ST_NOME AS NOME_REP,
        nf.agn_in_codigo  as COD_CLI,
        AGN.AGN_ST_NOME AS NOME_CLI,
        ITNF.PRO_IN_CODIGO AS COD_PROD,
        itnf.itn_st_descricao as NOME_PROD,
        itnf.itn_re_quantidade as QUANTIDADE,
        itnf.itn_re_valorunitario as  VLR_UNITARIO_VENDA,
        itnf.uni_st_unidade as UNIDADE_MEDIDA,
        nf.not_re_valortotal as VALOR_TOTAL,
        nf.not_dt_emissao as DT_VENDA,
        NF.NOT_IN_numero  as NUMERO_NF,
        to_char(sysdate,'DD/MM/YYYY') as DATA_ATUAL, 
        to_char(to_date(SYSDATE),'MM') - to_char(nf.not_dt_emissao,'MM') as MESES_DA_VENDA

  from mgven.ven_notafiscal NF,
       mgven.ven_itemnotafiscal ITNF,
       mgglo.glo_agentes AGN,
       mgglo.glo_agentes REP,
       mgadm.est_produtos PRO,
       mgglo.glo_agentes_id id_agn


 where NF.agn_tab_in_codigo = AGN.agn_tab_in_codigo
       and NF.agn_pad_in_codigo = AGN.agn_pad_in_codigo
       and NF.agn_in_codigo = AGN.agn_in_codigo
       and NF.org_tab_in_codigo = ITNF.org_tab_in_codigo
       and NF.org_pad_in_codigo = ITNF.org_pad_in_codigo
       and NF.org_in_codigo = ITNF.org_in_codigo
       and NF.org_tau_st_codigo = ITNF.org_tau_st_codigo
       and NF.seq_tab_in_codigo = ITNF.seq_tab_in_codigo
       and NF.seq_in_codigo = ITNF.seq_in_codigo
       and NF.not_in_codigo = ITNF.not_in_codigo
       AND itnf.pro_in_codigo = pro.pro_in_codigo
       AND REP.AGN_IN_CODIGO = NF.REP_IN_CODIGO
       AND NF.AGN_IN_CODIGO = ID_AGN.AGN_IN_CODIGO
       

and   nf.not_dt_emissao  =  (select  max(cond_nf.not_dt_emissao) from mgven.ven_notafiscal cond_nf
                                   where cond_nf.agn_in_codigo = nf.agn_in_codigo 
                                    AND COND_NF.NOT_DT_EMISSAO >= ADD_MONTHS(LAST_DAY(SYSDATE),-3)+1)


       and nf.not_ch_situacao <> 'C'
      and pro.pro_in_codigo not in (select ina.pro_in_codigo from mgadm.est_inativaproduto INA
                                           where pro.pro_in_codigo = ina.pro_in_codigo)




   AND id_agn.agn_tau_st_codigo = 'C'
   and id_agn.agn_ch_status = 'A'
   
  
  
