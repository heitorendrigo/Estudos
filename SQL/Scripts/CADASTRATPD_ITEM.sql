insert into mgven.ven_tipodocgrupoestoque 
VALUES 
(155,
1,
&TPD,
(SELECT MAX(TDG_IN_SEQUENCIA)+1 FROM mgven.ven_tipodocgrupoestoque where TPD_IN_CODIGO = &TPD),
101,
1,
(select gru_ide_st_codigo from mgadm.est_produtos  where pro_in_codigo = &itn),
(select gru_in_codigo from mgadm.est_produtos  where pro_in_codigo = &itn)
)
  

