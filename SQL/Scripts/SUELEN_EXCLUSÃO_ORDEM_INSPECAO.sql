select t.ins_ch_inspecionado,t.rowid from mgadm.est_itensinspecao t
where t.ins_st_documento IN ('405236')

--alterando o 'ins_ch_inspecionado'  para 'C' a inspeção nao sera mais listada para o laboratorio utilizar o update abaixo
=====================================

update mgadm.est_itensinspecao t
set t.ins_ch_inspecionado = 'C'
where t.ins_st_documento in ('405236')

