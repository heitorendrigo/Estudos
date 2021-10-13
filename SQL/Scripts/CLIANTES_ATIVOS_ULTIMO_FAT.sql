select *


from mgcli.cli_vw_ultimofaturamento ult_fat, 
     mgcli.cli_vw_faturamento  fat
     mgglo.glo_agentes cli, 
     mgglo.glo_agentes rep,

     
where ult_fat.NOT_IN_NUMERO = fat.NUMERO_NF
and ult_fat.NOT_DT_EMISSAO = fat.DT_VENDA
and ult_fat.AGN_IN_CODIGO = cli.agn_in_codigo
and ult_fat.REP_IN_CODIGO = rep.agn_in_codigo
and fat.COD_CLI = cli.agn_in_codigo
and fat.COD_REP = rep.agn_in_codigo
*********************************REVISADO ATE AQUI**********************

--PARA CLIENTES ATIVOS MANTER ESTE BLOCO
and cli.agn_in_codigo in 
(SELECT C.AGN_IN_CODIGO 
        FROM MGGLO.GLO_AGENTES_ID C 
        WHERE C.AGN_TAU_ST_CODIGO = 'C'     -- clientes ativos
        
        AND C.AGN_CH_STATUS = 'A' 
        
        AND C.AGN_DT_INICIOMOV <= SYSDATE)
--PARA CLIENTES ATIVOS MANTER ESTE BLOCO

and fat.NOT_IN_NUMERO  = itn_fat.NUMERO_NF
and fat.NOT_DT_EMISSAO = itn_fat.DT_VENDA
and fat.NOT_DT_EMISSAO <= '01-jan-2019'
        

group  by rep.agn_st_fantasia,CLI.AGN_IN_CODIGO,CLI.AGN_ST_FANTASIA,fat.NOT_IN_NUMERO,FAT.NOT_DT_EMISSAO,
FAT.NOT_RE_VALORTOTAL,itn_fat.NOME_PROD,itn_fat.VLR_UNITARIO_VENDA,itn_fat.QUANTIDADE







