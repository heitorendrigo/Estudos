
-- RELATORIOS DO  USUARIO
INSERT mgglo.glo_relatorio_usuario (GRU_IN_CODIGO, rel_in_codigo, rus_bo_editar, RUS_BO_EXECUTAR, rus_bo_excluir) 
select &USUARIO_DESTINO AS GRU_IN_CODIGO, e.rel_in_codigo, 'N'  as RUS_BO_EDITAR, 'S' AS RUS_BO_EXECUTAR, 'N'AS RUS_BO_EXCLUIR 
from mgglo.glo_relatorio_usuario e
where  e.gru_in_codigo = &USUARIO_ORIGEM


-- TPD DO  USUARIO
--insert into mgven.ven_usutipodoc (TPD_TAB_IN_CODIGO,TPD_PAD_IN_CODIGO,TPD_IN_CODIGO,TDU_BO_APROVADOR,USU_IN_CODIGO)
(select p.tpd_tab_in_codigo,p.tpd_pad_in_codigo,p.tpd_in_codigo,'S' AS TDU_BO_APROVADOR,&USUARIO_NOVO USU_IN_CODIGO from mgven.ven_usutipodoc p
where p.usu_in_codigo = &USUARIO_ORIGEM
and p.tpd_in_codigo not in (select o.tpd_in_codigo from mgven.ven_usutipodoc o where o.usu_in_codigo = &USUARIO_NOVO)) --joao

-- USUARIOS DO MODULO MATERIAIS

-- USUARIOS DO MODULO MANUFAT.
