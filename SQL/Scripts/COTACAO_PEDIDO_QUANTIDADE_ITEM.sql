select itncot.pro_in_codigo AS PRODUTO, Cot.Cot_In_Codigo as COTACAO, 
PED.PDC_IN_CODIGO AS PEDIDO_COMPRA, PED.PDC_DT_EMISSAO AS DATA_PEDIDO ,
itnped.itp_re_quantidade as QUANTIDADE_PEDIDO, ITNCOT.COI_RE_QTDMINIMA AS QUANTIDADE_COTACAO 


from
mgadm.est_pedcompras ped, mgadm.est_cotacoes cot, 
mgadm.est_cotapedido cotaped, mgadm.est_itenspedcompra itnped, 
mgadm.est_itenscota itncot

where ped.pdc_in_codigo = cotaped.pdc_in_codigo
and cotaped.cot_in_codigo = cot.cot_in_codigo
and itncot.cot_in_codigo = cot.cot_in_codigo
and itnped.pdc_in_codigo = ped.pdc_in_codigo
and itnped.pro_in_codigo = itncot.pro_in_codigo
AND ITNPED.ITP_IN_SEQUENCIA = COTAPED.ITP_IN_SEQUENCIA

and ped.agn_in_codigo = 25358 
and ped.pdc_dt_emissao between '01-jan-2014' and '31-dez-2014'
and itnped.itp_re_quantidade <> itncot.coi_re_qtdsugerida
