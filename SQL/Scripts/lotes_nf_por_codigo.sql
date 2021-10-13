select a.itn_in_sequencia,a.mvs_dt_validade, a.rowid    --lotes para NF de importação
from mgven.ven_itemnotaestoque a, mgven.ven_notafiscal p
where a.not_in_codigo = p.not_in_codigo
and p.not_in_numero = 5951
