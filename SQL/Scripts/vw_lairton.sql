create or replace view mgcli.cli_vw_nfentradas as
-- CRIADO POR HEITOR ROCHA (CLIENTE) PARA RELATORIOS DE CONFERENCIAS FISCAIS DOS IMPOSTOS.
select 
TO_CHAR(nf.not_in_numero) as not_in_numero,
TO_CHAR(nf.not_dt_emissao) as not_dt_emissao,
nf.not_re_valortotal,
agn.agn_in_codigo,
agn.agn_st_fantasia,
itn.pro_in_codigo,
pro.pro_st_descricao,
itn.cfop_in_codigo, 
cfop.cfop_st_extenso,
ncm.ncm_st_extenso, 
itn.itn_re_valortotal,
itn.itn_ch_sticms_a,
itn.itn_ch_sticms_b,
itn.itn_st_stipi,
itn.eni_st_codigo,
itn.stc_st_cstcofins,
itn.stp_st_cstpis,

itn.itn_re_baseicms,
itn.itn_re_aliqicms,
itn.itn_re_valoricms, -- para o relatorio de confrecia de imposto ICMS
itn.itn_re_isentoicms,
itn.itn_re_outrosicms,



itn.itn_re_baseipi,
itn.itn_re_aliqipi,
itn.itn_re_valoripi, -- para o relatorio de confrecia de imposto IPI
itn.itn_re_outrosipi,
itn.itn_re_isentoipi,



itn.itn_re_vlbasepis,
itn.itn_re_percpis,
itn.itn_re_vlpisrecupera,   -- para o relatorio de confrecia de imposto PIS/COFINS

itn.itn_re_vlbasecofins,
itn.itn_re_perccofins,
itn.itn_re_vlcofinsrecupera  -- para o relatorio de confrecia de imposto PIS/COFINS


from 
mgven.ven_notafiscal nf, 
mgven.ven_itemnotafiscal itn, 
mgadm.est_produtos pro, 
mgglo.glo_agentes agn, 
mgtrf.trf_cfop cfop,
mgtrf.trf_ncm ncm

where nf.not_in_codigo = itn.not_in_codigo -- link tabela de notas com itens das notas.
and itn.pro_in_codigo = pro.pro_in_codigo -- link tabela de produtos
and nf.agn_in_codigo = agn.agn_in_codigo -- link tabela de agentes
and itn.cfop_in_codigo = cfop.cfop_in_codigo -- link tabela de CFOP
and itn.itn_st_ncm_extenso = ncm.ncm_st_extenso
and nf.not_ch_situacao <> 'C'   -- notas que nao foram canceladas
and nf.tpd_in_codigo = 22 -- apenas notas de importado


union all

(select
TO_CHAR(nfr.rcb_st_nota),
TO_CHAR(nfr.rcb_dt_documento),
nfr.rcb_re_totalnota,
agn.agn_in_codigo,
agn.agn_st_fantasia,
itnr.pro_in_codigo,
pro.pro_st_descricao,
itnr.cfop_in_codigo, 
cfop.cfop_st_extenso,
ncm.ncm_st_extenso,
itnr.rci_re_vltotal,

itnr.rci_ch_sticms_a,
itnr.rci_ch_sticms_b,
itnr.rci_st_stipi,
itnr.eni_st_codigo,

itnr.stc_st_cstcofins,
itnr.stp_st_cstpis,

itnr.rci_re_vlbaseicm,
itnr.rci_re_percicm,
itnr.rci_re_vlicms,
itnr.rci_re_vlisenicm,
itnr.rci_re_vloutricm,

itnr.rci_re_vlbaseipi,
itnr.rci_re_percipi,
itnr.rci_re_vlipi,
itnr.rci_re_vloutripi,
itnr.rci_re_vlisenipi,


itnr.rci_re_vlbasepis,
itnr.rci_re_percpis,
itnr.rci_re_vlpisrecupera,


itnr.rci_re_vlbasecofins,
itnr.rci_re_perccofins,
itnr.rci_re_vlcofinsrecupera



from mgadm.est_recebimento nfr, 
mgadm.est_itensreceb itnr, 
mgadm.est_produtos pror, 
mgglo.glo_agentes agn, 
mgtrf.trf_cfop cfop,
mgtrf.trf_ncm ncm,
mgadm.est_produtos pro

where nfr.rcb_st_nota = itnr.rcb_st_nota
and itnr.pro_in_codigo = pro.pro_in_codigo
and nfr.agn_in_codigo = agn.agn_in_codigo
and itnr.cfop_in_codigo = cfop.cfop_in_codigo
and itnr.ncm_in_codigo = ncm.ncm_in_codigo
--and nfr.acao_in_codigo in ()  -- para filtrar as ações que serão listadas.
)

