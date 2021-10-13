--Select para conferencia prévia do update

select itn.ped_in_codigo, itn.pro_in_codigo, itn.itp_ch_sticms_a, itn.rowid
from mgven.ven_itempedidovenda itn
where itn.ped_in_codigo in (445230 ,446317 ,448373 ,448373 ,448377 ,448377 ,448951) --Pedidos
and itn.pro_in_codigo in (1365,2908) --Produtos
and itn.itp_ch_sticms_a = 3     -- ICMS A Atual que será trocada.
                                 
--======================================
--Execução do Update

update mgven.ven_itempedidovenda itn
set itn.itp_ch_sticms_a = 5  -- Nova ICMS A
where itn.ped_in_codigo in (445230 ,446317 ,448373 ,448373 ,448377 ,448377 ,448951) --Pedidos
and itn.pro_in_codigo in (1365,2908) --Produtos
and itn.itp_ch_sticms_a = 3 --Antiga ICMS A

--====================================
