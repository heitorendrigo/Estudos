select TO_CHAR(p.not_in_numero) from mgven.ven_notafiscal p

where p.not_in_numero = 79955

union all
(select TO_CHAR(sysdate) from dual) 
