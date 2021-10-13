update mgglo.glo_relacao_cli_rep t

set t.rep_agn_in_codigo = &REPRESENTANTE_NOVO --REPRESENTANTE NOVO
where t.cli_agn_in_codigo in (select cli_rep.cli_agn_in_codigo
                               from 
                               mgglo.glo_cliente cli, 
                               mgglo.glo_representante rep, 
                               mgglo.glo_relacao_cli_rep cli_rep, 
                               mgglo.glo_agentes_id id 
                               where 
                               cli.agn_in_codigo = cli_rep.cli_agn_in_codigo and
                               rep.agn_in_codigo = cli_rep.rep_agn_in_codigo and
                               cli.agn_in_codigo = id.agn_in_codigo and
                               id.agn_tau_st_codigo = 'C' and
                               --id.agn_ch_status = 'A' and --apenas clientes ativos
                               cli_rep.rep_agn_in_codigo = &REPRESENTANTE_ANTIGO -- REPRESENTANTE ANTIGO
                               ) 
