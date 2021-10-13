iNSERT INTO mgglo.glo_relatorio_usuario 

(rel_in_codigo,gru_in_codigo,rus_bo_editar,rus_bo_executar,rus_bo_excluir) values
(&relatorio,&usuario,'N','S','N')

-- AO EXECUTAR, O PL/SQL SOLICITARA O VALOR DAS VARIAVEIS RELATORIO E USUARIO.
