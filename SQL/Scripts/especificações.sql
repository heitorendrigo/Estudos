select distinct(q.med_st_nome) from mgCLI.Cli_Mvw_Especitens P, MGADM.EST_ESPECIFICACOES q
WHERE P.PRO_IN_CODIGO IN (4049,1303,3864,1478,1359,1365,1486,1333,1332,1510,4506,1316,1364,1384,1472)
and p.med_in_sequencia = q.med_in_sequencia
