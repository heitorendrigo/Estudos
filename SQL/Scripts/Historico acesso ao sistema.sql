select p.* from mgglo.glo_log_acesso p
where p.usu_in_codigo = &usuario
and p.usu_dt_login > &dt_ini
and p.usu_dt_login < &dt_fim
