select p.not_st_uf  as estado,
       P.NOT_IN_NUMERO,
       P.NOT_IN_CODIGO,
       P.AGN_IN_CODIGO,
       P.AGN_TAU_ST_CODIGO,
       P.NOT_DT_EMISSAO,
       ITNF.PRO_IN_CODIGO,
       ITNF.ITN_ST_DESCRICAO,

       nvl((Select 'X' from mgglo.Glo_Agenteiesubst I
       where i.uf_st_sigla = p.not_st_uf),' ') as ST,
       
       
      nvl(( select 'X' from mgtrf.trf_zfm ZF,MGGLO.GLO_PFISCAL_AGENTE AGF,MGGLO.GLO_AGENTES AG
      where  AG.agn_tab_in_codigo = AGF.agn_tab_in_codigo
         and AG.agn_pad_in_codigo = AGF.agn_pad_in_codigo
         and AG.agn_in_codigo = AGF.agn_in_codigo
         and AG.uf_st_sigla = ZF.uf_st_sigla
         and AG.mun_in_codigo = ZF.mun_in_codigo 
         AND  P.AGN_IN_CODIGO = AG.AGN_IN_CODIGO
         AND AGF.AGN_BO_ENQUADRASUFRAMA = 'S'
         AND (AG.AGN_ST_SUFRAMA IS NOT NULL or AG.AGN_ST_SUFRAMA <> '')
         AND AGF.AGN_DT_INIVIGENCIA = (SELECT MAX(L.AGN_DT_INIVIGENCIA)FROM MGGLO.GLO_PFISCAL_AGENTE L WHERE L.AGN_IN_CODIGO = P.AGN_IN_CODIGO ) ),' ') as SUFRAMA,
       
      nvl((Select 'OBRIGATORIO' from mgadm.est_produtos PRO,MGCLI.CLI_VW_ESPECITENS ESPEC
      where     P.NOT_IN_CODIGO = ITNF.NOT_IN_CODIGO
       AND    ITNF.PRO_IN_CODIGO = PRO.PRO_IN_CODIGO
       AND     PRO.PRO_IN_codigo = ESPEC.PRO_IN_CODIGO
       AND   ESPEC.MED_IN_SEQUENCIA = 33
       AND     ESPEC.MEP_ST_VALOR IS NOT NULL
       GROUP BY PRO.PRO_IN_CODIGO),'OPCIONAL') as FICHA_VERMELHA


       from mgven.ven_notafiscal p,MGVEN.VEN_ITEMNOTAFISCAL ITNF  
       WHERE P.NOT_IN_CODIGO = ITNF.NOT_IN_CODIGO  -- LINK NOTA FISCAL COM ITENS NOTA FISCAL
       AND P.NOT_CH_SITUACAO <> 'C'  -- EXCLUI NOTAS CANCELADAS
