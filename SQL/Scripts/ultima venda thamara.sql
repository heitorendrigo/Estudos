select nf.*

from mgven.ven_notafiscal nf, mgglo.glo_agentes agn, mgglo.glo_agentes_id agn_id

where nf.agn_in_codigo = agn.agn_in_codigo
and agn.agn_in_codigo = agn_id.agn_in_codigo  
and agn_id.agn_tau_st_codigo = 'C'   -- agentes cliente

and nf.not_dt_emissao = (Select max(p.not_dt_emissao) from mgven.ven_notafiscal p where p.agn_in_codigo = agn.agn_in_codigo )
and nf.not_in_numero = (Select max(p.not_in_numero) from mgven.ven_notafiscal p where p.agn_in_codigo = agn.agn_in_codigo )
