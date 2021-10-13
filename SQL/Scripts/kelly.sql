select pro.pro_in_codigo as "COD MEGA",
pro.pro_st_descricao AS DESCRICAO,
pro.pcd_st_codigo as "CST ICMS (A)",
pro.pro_st_alternativo AS ALTERNATIVO

from mgadm.est_produtos pro, mgadm.est_especificacoes e

where pro.Pro_St_Defitem = 'PA'
and pro.pro_in_codigo not in (select i.pro_in_codigo from mgadm.est_inativaproduto i )
group by 
pro.pro_in_codigo,pro.pro_st_descricao ,pro.pcd_st_codigo, pro.pro_st_alternativo
