Select 
ITN.GRU_IN_SEQUENCIAL AS SEQ_GRUPO,
itn.patr_st_extenso AS EXTENSO,
itn.patr_dt_baixa AS DATA_BAIXA,
p.lan_re_valor AS VALOR_BAIXA, 
p.lan_in_sequencial AS SEQUENCIAL_LANCAMENTO,
p.patr_in_sequencial AS SEQUENCIAL_PATRIMONIO, 
us.gru_st_nome as USUARIO_BAIXA 


from mgati.ati_lancamento p, mgati.ati_itempatrimonio itn, mgglo.glo_grupo_usuario us
where itn.patr_in_sequencial = p.patr_in_sequencial
and p.acao_in_codigo = 502
and itn.patr_dt_baixa between '01-jan-2019' AND '01-jan-2020'
and us.gru_in_codigo = p.usu_in_alteracao 

and p.lan_dt_ultalteracao > '01-jan-2019'
and p.lan_dt_ultalteracao < '01-jan-2020'

--Valor, Grupo, nome, 
