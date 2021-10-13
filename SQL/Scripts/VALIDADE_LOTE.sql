select  lot.mvt_dt_validade
                  from 
                  mgadm.est_movimento mov,
                  mgadm.est_lotesmovimento lot, 
                  mgven.ven_notafiscal nf, 
                  mgven.ven_itemnotafiscal itnf

                  where 
                  lot.mvt_in_lancam = mov.mvt_in_lancam -- link 
                  and nf.tpd_in_codigo in (10,11,12,13,41,26)  -- tpd de notas
                  and nf.not_dt_emissao = mov.mvt_dt_movimento  -- link de data da nota com o movimento.
                  and nf.not_in_codigo = itnf.not_in_codigo  -- link nf com itens nf
                  and itnf.pro_in_codigo = mov.pro_in_codigo  -- link itens nf
                  and nf.not_in_numero = TO_CHAR(mov.mvt_st_numdoc) -- link
                  and mov.mvt_st_numdoc = '83479'  -- numero da nota
