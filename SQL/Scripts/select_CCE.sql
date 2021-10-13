select nf.not_in_nnf from mgnfe.nfe_evento eve,  mgnfe.nfe_nfe nfe, mgnfe.nfe_notafiscal nf
where eve.nfe_in_sequencia = nfe.nfe_in_sequencia
and nfe.not_in_sequencia = nf.not_in_sequencia
and eve.eve_in_seqevento = 8






