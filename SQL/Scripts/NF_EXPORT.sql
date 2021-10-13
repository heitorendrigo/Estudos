select p.not_in_numero, P.NOT_IN_CODIGO,p.not_dt_emissao, ped.pe_ped_in_codigo, nfe.not_in_sequencia

from mgven.ven_notafiscal p, mgven.ven_itempedi_ven_itemnot ped, mgnfe.nfe_notafiscal nfe
where p.tpd_in_codigo = 41
and p.not_in_codigo  = ped.nf_not_in_codigo
and p.not_dt_emissao > '01-01-2017'
and p.not_in_numero = nfe.not_in_nnf
group by p.not_in_numero,P.NOT_IN_CODIGO, p.not_dt_emissao, ped.pe_ped_in_codigo, nfe.not_in_sequencia
