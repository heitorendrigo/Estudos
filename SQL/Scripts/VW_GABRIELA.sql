select rec.agn_in_codigo, rec.rcb_st_nota,rec.rcb_dt_documento, it.pro_in_codigo 

from mgadm.est_recebimento rec, mgadm.est_itensreceb it

where rec.rcb_st_nota = it.rcb_st_nota
and rec.rcb_st_nota = 
(select max(p.rcb_st_nota) from mgadm.est_recebimento p, mgadm.est_itensreceb o where p.agn_in_codigo = rec.agn_in_codigo and p.rcb_st_nota = o.rcb_st_nota and o.pro_in_codigo = it.pro_in_codigo)

and rec.agn_in_codigo = 10742
