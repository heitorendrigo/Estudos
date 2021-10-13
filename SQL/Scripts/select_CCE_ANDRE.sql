select nf.not_in_nnf 

from mgnfe.nfe_evento eve,  mgnfe.nfe_nfe nfe, mgnfe.nfe_notafiscal nf, mgven.ven_notafiscal vennf, mgven.ven_itemnotafiscal venitn

where  vennf.not_in_numero = nf.not_in_nnf
and eve.nfe_in_sequencia = nfe.nfe_in_sequencia
and nfe.not_in_sequencia = nf.not_in_sequencia
and nf.not_in_nnf = vennf.not_in_numero 
and vennf.not_in_codigo = venitn.not_in_codigo
and vennf.not_dt_emissao > '01-jul-2015'
and venitn.pro_in_codigo = 2665






