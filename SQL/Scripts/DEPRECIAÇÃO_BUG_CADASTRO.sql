SELECT p.patr_in_sequencial,p.patr_st_extenso,p.patr_st_descricao,p.gru_in_sequencial, p.rowid FROM MGATI.ATI_ITEMPATRIMONIO p
where p.gru_in_sequencial is null
-- bug cadastral do mega, ao cdastrar um patrimonio, se nao for feito por partes, recadastrando o grupo do item
--2 vezes antes de gerar o lançamento de aquisição e depreciação o cadastro do item perde o vinculo com o grupo,
--nao aparecendo nos relatorios de depreciação do sistema.
--ao rodar este select se ja tiver movimentos, ajustar o campo GRU_IN_SEQUENCIAL e o relatorio tera o valor correto.
