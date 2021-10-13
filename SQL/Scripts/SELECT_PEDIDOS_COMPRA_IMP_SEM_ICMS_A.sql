select itn.pdc_in_codigo,itn.itp_ch_sticms_a, prod.pcd_st_codigo from 
mgglo.glo_agentes agn, mgadm.est_pedcompras ped, 
mgadm.est_itenspedcompra itn, mgadm.est_produtos prod

where ped.agn_in_codigo = agn.agn_in_codigo --link pedido agente

and ped.pdc_in_codigo = itn.pdc_in_codigo -- link pedido item
and itn.pro_in_codigo = prod.pro_in_codigo --link item produto


and itn.itp_ch_sticms_a is null -- sem situção A no pedido
and itn.itp_st_situacao = 'PA'  -- item do pedido em aberto
and ped.pdc_st_situacao = 'PA'  -- pedido em aberto
and agn.UF_st_sigla = 'EX'      -- agente do exterior
and prod.pcd_st_codigo is not null -- item com cadastro A

