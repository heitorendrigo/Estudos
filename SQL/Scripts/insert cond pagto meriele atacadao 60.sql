insert into mgglo.glo_agente_condpagto (AGN_TAB_IN_CODIGO ,AGN_PAD_IN_CODIGO ,AGN_IN_CODIGO, AGN_TAU_ST_CODIGO,COND_TAB_IN_CODIGO,COND_PAD_IN_CODIGO,COND_ST_CODIGO)
select 
53 AS AGN_TAB_IN_CODIGO,
1 AS AGN_PAD_IN_CODIGO,
AGN.AGN_IN_CODIGO AS AGN_IN_CODIGO,
'C'AGN_TAU_ST_CODIGO,                       --- SELECT QUE SERA ISERIDO A TODOS OS AGENTES 
61 AS COND_TAB_IN_CODIGO,
1 COND_PAD_IN_CODIGO,
60 COND_ST_CODIGO

from mgglo.glo_agentes agn
where agn.agn_st_fantasia LIKE ('ATAC/%')

AND AGN.AGN_IN_CODIGO NOT IN (SELECT A.AGN_IN_CODIGO
                              FROM MGGLO.GLO_AGENTES A, MGGLO.GLO_AGENTE_CONDPAGTO C
                              WHERE A.AGN_IN_CODIGO = C.AGN_IN_CODIGO
                              AND A.agn_st_fantasia LIKE ('ATAC/%') 
                              AND C.COND_ST_CODIGO = '60')           ---EXCLUIR OS AGENTES QUE JÁ TEM A COD 60 CADASTRADA

                                               

