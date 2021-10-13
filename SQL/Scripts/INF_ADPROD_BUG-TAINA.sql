select p.pun_bo_unidpadraotrib,p.rowid from mgadm.est_prouni p
where p.pro_in_codigo in (select itn.pro_in_codigo from mgven.ven_notafiscal nf, mgven.ven_itemnotafiscal itn where nf.not_in_codigo = itn.not_in_codigo and nf.not_in_numero = &nf)
and p.pun_bo_unidpadraotrib = 'S'
--Setar  p.pun_bo_unidpadraotrib = 'N' e gerar novo lote
