select (select count(A.ped_in_codigo) from mgven.ven_pedidovenda A
where A.ped_dt_emissao between &ANTERIOR_INICIO and  &ANTERIOR_FIM ) as PEDIDOS_ANTERIOR,

(select count(p.ped_in_codigo) from mgven.ven_aprovacaopedido AP, mgven.ven_pedidovenda P
where ap.ped_in_codigo = p.ped_in_codigo
and  p.ped_dt_emissao between &ANTERIOR_INICIO and  &ANTERIOR_FIM )  AS APROVADOS_ANTERIOR,

((select count(p.ped_in_codigo) from mgven.ven_aprovacaopedido AP, mgven.ven_pedidovenda P
where ap.ped_in_codigo = p.ped_in_codigo
and  p.ped_dt_emissao between &ANTERIOR_INICIO and  &ANTERIOR_FIM)/ (select count(A.ped_in_codigo) from mgven.ven_pedidovenda A
where A.ped_dt_emissao between &ANTERIOR_INICIO and  &ANTERIOR_FIM )*100) as PERCENTUAL_ANTERIOR, 


(select count(A.ped_in_codigo) from mgven.ven_pedidovenda A
where A.ped_dt_emissao between &ATUAL_INICIO and  &ATUAL_FIM ) as PEDIDOS_ATUAL,

(select count(p.ped_in_codigo) from mgven.ven_aprovacaopedido AP, mgven.ven_pedidovenda P
where ap.ped_in_codigo = p.ped_in_codigo
and  p.ped_dt_emissao between &ATUAL_INICIO and  &ATUAL_FIM)  AS APROVADOS_ATUAL,

((select count(p.ped_in_codigo) from mgven.ven_aprovacaopedido AP, mgven.ven_pedidovenda P
where ap.ped_in_codigo = p.ped_in_codigo
and  p.ped_dt_emissao between &ATUAL_INICIO and  &ATUAL_FIM)/ (select count(A.ped_in_codigo) from mgven.ven_pedidovenda A
where A.ped_dt_emissao between &ATUAL_INICIO and  &ATUAL_FIM )*100) as PERCENTUAL_ATUAL,

(
((select count(p.ped_in_codigo) from mgven.ven_aprovacaopedido AP, mgven.ven_pedidovenda P
where ap.ped_in_codigo = p.ped_in_codigo
and  p.ped_dt_emissao between &ANTERIOR_INICIO and  &ANTERIOR_FIM)/ (select count(A.ped_in_codigo) from mgven.ven_pedidovenda A
where A.ped_dt_emissao between &ANTERIOR_INICIO and  &ANTERIOR_FIM )*100)-((select count(p.ped_in_codigo) from mgven.ven_aprovacaopedido AP, mgven.ven_pedidovenda P
where ap.ped_in_codigo = p.ped_in_codigo
and  p.ped_dt_emissao between &ATUAL_INICIO and  &ATUAL_FIM)/ (select count(A.ped_in_codigo) from mgven.ven_pedidovenda A
where A.ped_dt_emissao between &ATUAL_INICIO and  &ATUAL_FIM )*100)
) AS DIFERENÇA

from dual
