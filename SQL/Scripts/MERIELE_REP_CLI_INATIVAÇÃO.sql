select ide.agn_ch_status,ide.rowid from mgglo.glo_agentes_id ide 
where ide.agn_in_codigo in

(select id.Agn_In_Codigo from mgglo.glo_cliente cli, mgglo.glo_representante rep, mgglo.glo_relacao_cli_rep cli_rep, mgglo.glo_agentes_id id 
where 
cli.agn_in_codigo = cli_rep.cli_agn_in_codigo and
rep.agn_in_codigo = cli_rep.rep_agn_in_codigo and
cli.agn_in_codigo = id.agn_in_codigo and
id.agn_tau_st_codigo = 'C' and
id.agn_ch_status = 'A' and
rep.agn_in_codigo in (216,217,224,225,226,228,230,231,234,235,239,240,242,243,244,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,297,20892,20968,20979,20980,21448)
)
