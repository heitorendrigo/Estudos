select i.* from mgven.ven_notafiscal p, mgven.ven_itemnotafiscal i
where p.not_in_codigo = i.not_in_codigo
and p.not_in_numero = 70950
