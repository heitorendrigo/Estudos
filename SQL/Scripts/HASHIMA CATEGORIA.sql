
select p.cat_in_reduzido from mgglo.glo_categoria p
where p.cat_st_apelido  NOT in ('AUTO01','AUTO02','AUTO08','AUTO07','AUTO10','ELEC01','ELEC02','ELEC03','INDU49','INDU03','CONS01','CONS08','CONS03')
and p.cat_ide_st_codigo = 'C'
and p.cat_ch_anasin = 'A'

-- UPDATE 1
update mgglo.glo_agentes_id o
SET O.CAT_IN_REDUZIDO = 113
where o.agn_tau_st_codigo = 'C'
and o.cat_in_reduzido in ('98','4','6','7','8','13','15','19','20','24','25','26','27','29','30','31','32','33','34','36','38','40','42','43','44','90','93','94','97','102','103','107','108','109','100','101','105')


-- UPDATE 2 -> CONCATENAMOS  - NÃO UTILIZAR (AJUSTANDO NOSMES GRNDES)


 SELECT P.*,P.ROWID FROM MGGLO.GLO_CATEGORIA P

WHERE P.cat_in_reduzido in ('98','4','6','7','8','13','15','19','20','24','25','26','27','29','30','31','32','33','34','36','38','40','42','43','44','90','93','94','97','102','103','107','108','109','100','101','105')



